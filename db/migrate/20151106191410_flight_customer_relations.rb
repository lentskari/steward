class FlightCustomerRelations < ActiveRecord::Migration
  def change
    add_reference :flight_customers, :flight, index: true
    add_reference :flight_customers, :customer, index: true
  end
end
