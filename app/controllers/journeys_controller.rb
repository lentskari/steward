class JourneysController < ApplicationController
  def show
    customer = Customer.find(params.require(:customer_id))
    lat = params.require(:lat)
    lon = params.require(:lon)
    current_address = Geocode.from_latlng(lat, lon).full_address
    Rails.logger.info(params)
    first_flight = customer.flights.first
    origin_airport = Airport.find_by_code(first_flight.origin)
    destination_airport = Airport.find_by_code(first_flight.destination)
    flight_duration = first_flight.arrival_time - first_flight.departure_time
    render json: {
      current_address: current_address,
      next: {
        flight: first_flight,
        origin_airport: origin_airport,
        destination_airport: destination_airport,
        flight_duration: flight_duration
      }
    }
  end
end
