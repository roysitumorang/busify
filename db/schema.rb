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

ActiveRecord::Schema.define(version: 20160103063113) do

  create_table "bus_types", force: :cascade do |t|
    t.string   "name",       limit: 255,              null: false
    t.string   "slug",       limit: 255,              null: false
    t.integer  "capacity",                            null: false
    t.integer  "left",                                null: false
    t.integer  "right",                               null: false
    t.string   "facility",   limit: 255, default: [], null: false, array: true
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "bus_types", ["capacity"], name: "index_bus_types_on_capacity", using: :btree
  add_index "bus_types", ["created_by"], name: "index_bus_types_on_created_by", using: :btree
  add_index "bus_types", ["name"], name: "index_bus_types_on_name", using: :btree
  add_index "bus_types", ["slug"], name: "index_bus_types_on_slug", using: :btree
  add_index "bus_types", ["updated_by"], name: "index_bus_types_on_updated_by", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",          limit: 255,              null: false
    t.string   "slug",          limit: 255,              null: false
    t.string   "operator_type", limit: 255, default: [], null: false, array: true
    t.text     "address"
    t.string   "phone",         limit: 255, default: [], null: false, array: true
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "companies", ["created_by"], name: "index_companies_on_created_by", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree
  add_index "companies", ["operator_type"], name: "index_companies_on_operator_type", using: :btree
  add_index "companies", ["slug"], name: "index_companies_on_slug", using: :btree
  add_index "companies", ["updated_by"], name: "index_companies_on_updated_by", using: :btree

  create_table "places", force: :cascade do |t|
    t.integer  "region_id"
    t.string   "name",       limit: 255, null: false
    t.string   "type",       limit: 255, null: false
    t.string   "slug",       limit: 255, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "places", ["created_by"], name: "index_places_on_created_by", using: :btree
  add_index "places", ["name"], name: "index_places_on_name", using: :btree
  add_index "places", ["region_id"], name: "index_places_on_region_id", using: :btree
  add_index "places", ["slug"], name: "index_places_on_slug", using: :btree
  add_index "places", ["type"], name: "index_places_on_type", using: :btree
  add_index "places", ["updated_by"], name: "index_places_on_updated_by", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255, null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

end
