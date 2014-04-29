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

ActiveRecord::Schema.define(version: 20140429031141) do

  create_table "trips", force: true do |t|
    t.string   "destination"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "fee"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips_users", id: false, force: true do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trips_users", ["user_id", "trip_id"], name: "index_trips_users_on_user_id_and_trip_id", unique: true

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.boolean  "gender"
    t.integer  "age"
    t.string   "college"
    t.string   "major"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
