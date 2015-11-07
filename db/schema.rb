# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151107114547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string  "name"
    t.string  "code"
    t.decimal "latitude"
    t.decimal "longitude"
  end

  create_table "bookings", force: :cascade do |t|
    t.string  "pnr"
    t.integer "customer_id"
  end

  add_index "bookings", ["customer_id"], name: "index_bookings_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "email"
    t.string   "name"
    t.string   "uber_access_token"
    t.string   "uber_refresh_token"
    t.datetime "uber_token_expires"
    t.string   "member_number"
  end

  create_table "flight_customers", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "flight_id"
    t.integer  "customer_id"
  end

  add_index "flight_customers", ["customer_id"], name: "index_flight_customers_on_customer_id", using: :btree
  add_index "flight_customers", ["flight_id"], name: "index_flight_customers_on_flight_id", using: :btree

  create_table "flights", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "type"
    t.string   "number"
    t.string   "origin"
    t.string   "destination"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.integer  "customer_id"
  end

  add_index "flights", ["customer_id"], name: "index_flights_on_customer_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
