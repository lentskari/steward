class CreateFlightCustomers < ActiveRecord::Migration
  def change
    create_table :flight_customers do |t|

      t.timestamps null: false
    end
  end
end
