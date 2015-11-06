class Api::FlightsController < ApplicationController
  require 'open-uri'

  FLIGHTS_URL = "http://www.finnair.fi/portalservices/flightlist"
  FLIGHTS_URL_PARAMS = "?format=json"

  skip_before_filter :verify_authenticity_token

  def show
    render json: flight_by_id(params[:id])
  end

  def index
    if params[:destination]
      render json: flight_by_destination
    else
      render json: flights
    end
  end

  def create
    api_flight = flight_by_id params[:number]
    flight = Flight.create(
      number: api_flight["flight_number"],
      origin: api_flight["origin_name"],
      destination: api_flight["destination_name"],
      arrival_time: Time.parse(api_flight["arrival_time"][0..4]),
      departure_time: Time.parse(api_flight["departure_time"][0..4])
    )
    render json: flight
  end

  private

  def flight_by_destination
    flights.select { |flight|
      flight["destination_name"].downcase.include? params[:destination]
    }
  end

  def flight_by_id(id)
    flights.find do |flight|
      flight["flight_number"] == id
    end
  end

  def flights
    JSON.parse("{#{open(FLIGHTS_URL + FLIGHTS_URL_PARAMS).read}}")["flights"]
  end
end

