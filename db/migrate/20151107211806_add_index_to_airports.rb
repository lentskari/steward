class AddIndexToAirports < ActiveRecord::Migration
  def change
    add_index :airports, :code
  end
end
