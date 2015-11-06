class FlightCustomer < ActiveRecord::Base

  belongs_to :flight, inverse_of: :flight_customer
  has_one :customer

end
