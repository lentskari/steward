class CustomerFlight < ActiveRecord::Migration
  def change
    add_reference :flights, :customer, index: true
  end
end
