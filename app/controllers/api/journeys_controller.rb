class Api::JourneysController < ApplicationController
  def show
    customer = Customer.find(params.require(:customer_id))
    lat = params.require(:lat)
    lon = params.require(:lon)
    current_address = Geocode.from_latlng(lat, lon).full_address
    Rails.logger.info(params)
    first_flight = customer.flights.first
    render json: {
      current_address: current_address,
      next_flight: {
      }
    }
  end
end
