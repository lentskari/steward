class FlightCustomer < ActiveRecord::Base

  belongs_to :flight
  belongs_to :customer

end
