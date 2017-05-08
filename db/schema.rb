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

ActiveRecord::Schema.define(version: 20170508210013) do

  create_table "addresses", force: :cascade do |t|
    t.string   "ip_address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",                   null: false
    t.integer  "level",       default: 0
    t.text     "description"
    t.text     "data"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "keys", force: :cascade do |t|
    t.integer  "key_type",   default: 0
    t.string   "name",                   null: false
    t.string   "value",                  null: false
    t.text     "data"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
