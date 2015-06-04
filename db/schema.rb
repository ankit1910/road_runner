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

ActiveRecord::Schema.define(version: 20150526093918) do

  create_table "assignments", force: true do |t|
    t.integer  "driver_id"
    t.integer  "delivery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["delivery_id"], name: "index_assignments_on_delivery_id", using: :btree
  add_index "assignments", ["driver_id"], name: "index_assignments_on_driver_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.integer  "pincode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities_companies", force: true do |t|
    t.integer  "city_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities_companies", ["city_id"], name: "index_cities_companies_on_city_id", using: :btree
  add_index "cities_companies", ["company_id"], name: "index_cities_companies_on_company_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "api_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliveries", force: true do |t|
    t.integer  "package_number"
    t.integer  "company_id"
    t.integer  "city_id"
    t.integer  "status"
    t.datetime "date_of_delivery"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deliveries", ["city_id"], name: "index_deliveries_on_city_id", using: :btree
  add_index "deliveries", ["company_id"], name: "index_deliveries_on_company_id", using: :btree

  create_table "drivers", force: true do |t|
    t.string   "name"
    t.string   "age"
    t.integer  "city_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "drivers", ["city_id"], name: "index_drivers_on_city_id", using: :btree
  add_index "drivers", ["company_id"], name: "index_drivers_on_company_id", using: :btree

end
