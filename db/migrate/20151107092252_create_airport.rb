class CreateAirport < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string "name"
      t.string "code"
      t.decimal "latitude"
      t.decimal "longitude"
    end
  end
end
