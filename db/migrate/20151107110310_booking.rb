class Booking < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      add_column :pnr, :string
    end
  end
end
