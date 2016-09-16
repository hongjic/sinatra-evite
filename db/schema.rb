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

ActiveRecord::Schema.define(version: 20160914220406) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name", limit: 50, default: "N/A", null: false
    t.datetime "date"
  end

  create_table "people", force: :cascade do |t|
    t.string  "name",    limit: 20, default: "N/A", null: false
    t.date    "birth"
    t.boolean "gender"
    t.integer "zipcode", limit: 4
  end

  add_index "people", ["name"], name: "name_UNIQUE", unique: true, using: :btree

  create_table "registrations", force: :cascade do |t|
    t.integer "people_id", limit: 4,                    null: false
    t.integer "events_id", limit: 4,                    null: false
    t.string  "status",    limit: 15, default: "maybe", null: false
  end

  add_index "registrations", ["events_id"], name: "events_id_idx", using: :btree
  add_index "registrations", ["people_id"], name: "people_id_idx", using: :btree

  add_foreign_key "registrations", "events", column: "events_id", name: "events_id"
  add_foreign_key "registrations", "people", column: "people_id", name: "people_id"
end
