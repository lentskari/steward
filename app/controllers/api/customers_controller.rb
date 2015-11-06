class Api::CustomersController < ApplicationController
  skip_before_filter :verify_authenticity_token # Turning of CSRF because these are used through API

  def show
    render json: Customer.find(params[:id])
  end

  def create
  end

  def authenticate_to_uber
    customer = Customer.find(params[:customer_id])
    authorization_code = params.require(:authorization_code)
    access_token, refresh_token, expires_at = UberAPI.new.authenticate(authorization_code)
    customer.update_attributes! uber_access_token: access_token,
                                uber_refresh_token: refresh_token,
                                uber_token_expires: expires_at
    render json: {}
  end
end
