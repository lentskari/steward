class CustomerBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :customer, index: true
  end
end
