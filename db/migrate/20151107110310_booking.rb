class Booking < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :pnr
    end
  end
end
