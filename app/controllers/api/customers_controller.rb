class Api::CustomersController < ApplicationController

  def show
    render json: Customer.find(params[:id])
  end

  def create
  end
end
