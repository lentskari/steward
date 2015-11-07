class Customer < ActiveRecord::Base
  has_many :bookings
  has_many :flights
end
