class Flight < ActiveRecord::Base

  has_many :flight_customers, inverse_of: :flight
end
