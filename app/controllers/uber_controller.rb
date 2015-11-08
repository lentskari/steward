class UberController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def request_ride
    start_lat  = params.require(:start_lat)
    start_lon  = params.require(:start_lon)
    end_lat  = params.require(:end_lat)
    end_lon  = params.require(:end_lon)
    ride = UberAPI.new.request_ride(start_lat: start_lat,
                               start_lon: start_lon,
                               end_lat: end_lat,
                               end_lon: end_lon)
    render json: ride
  rescue NoUberAvailableError
    render json: { reason: "No Ubers :(" }, status: 404
  end

  def show_ride
    ride_id = params.require(:ride_id)
    ride = UberAPI.new.show_ride_details(ride_id)
    render json: ride
  end
end
