class Api::FlightCustomersController < ApplicationController

  def show
    render json: FlightCustomer.find(params[:id])
  end

  def create
  end
end

