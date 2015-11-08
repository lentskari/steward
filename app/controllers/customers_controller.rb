class CustomersController < ApplicationController
  skip_before_filter :verify_authenticity_token # Turning of CSRF because these are used through API

  def show
    render json: Customer.find(params[:id])
  end

  def create
    finavia_api = FinaviaAPI.new
    profile = finavia_api.get_profile(params[:member_number])["profile"]
    basic_info = profile["basicInformation"]
    bookings = profile["bookings"]
    customer = Customer.create(
      member_number: params[:member_number],
      email: basic_info["email"],
      name: "#{basic_info["firstName"]} #{basic_info["lastName"]}",
    )
    bookings.each { |booking|
      Booking.create(
        pnr: booking["PNR"],
        customer_id: customer.id
      )
      booking_details = finavia_api.get_booking_detail(booking["PNR"])
      journeys = booking_details["journeys"]

      journeys.each { |journey|
        flights = journey["flights"]
        flights.each { |flight|
          Rails.logger.info flight
          Flight.create(
            customer_id: customer.id,
            arrival_time: flight["arrival"]["estimatedDateTime"],
            departure_time: flight["departure"]["estimatedDateTime"],
            origin: flight["departure"]["airport"],
            destination: flight["arrival"]["airport"]
          )
        }
      }
    }

    render json: customer, include: { flights:  customer["flights"] }
  end

  def show_flights
  end

  def authenticate_to_uber
    customer = Customer.find(params[:customer_id])
    authorization_code = params.require(:authorization_code)
    auth_data = UberAPI.new.authenticate(authorization_code)
    customer.update_attributes!(uber_access_token: auth_data[:access_token],
                                uber_refresh_token: auth_data[:refresh_token],
                                uber_token_expires: auth_data[:expires_at])
    render json: {}
  end
end
