class AddFlightColums < ActiveRecord::Migration
  def change
    add_column :flights, :type, :string
    add_column :flights, :number, :string
    add_column :flights, :origin, :string
    add_column :flights, :destination, :string
    add_column :flights, :departure_time, :datetime
    add_column :flights, :arrival_time, :datetime
  end
end
