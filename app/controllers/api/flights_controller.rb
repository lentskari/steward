class Api::FlightsController < ApplicationController
  require 'open-uri'

  FLIGHTS_URL = "http://www.finnair.fi/portalservices/flightlist"
  FLIGHTS_URL_PARAMS = "?format=json"

  def index
    if params[:destination]
      render json: flight_by_destination
    else
      render json: flights
    end
  end

  def show
    render json: flight_by_id
  end

  private

  def flight_by_destination
    flights.select { |flight|
      flight["destination_name"].downcase.include? params[:destination]
    }
  end

  def flight_by_id
    flights.find do |flight|
      flight["flight_number"] == params[:id]
    end
  end

  def flights
    JSON.parse("{#{open(FLIGHTS_URL + FLIGHTS_URL_PARAMS).read}}")["flights"]
  end
end

