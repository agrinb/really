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

ActiveRecord::Schema.define(version: 20140716013429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agent_profiles", force: true do |t|
    t.string   "description"
    t.string   "from_hour"
    t.string   "to_hour"
    t.integer  "user_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "realty"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "zip_code"
    t.string   "radius",      default: "10"
  end

  create_table "appointments", force: true do |t|
    t.integer  "agent_profile_id"
    t.integer  "property_id",      null: false
    t.string   "instructions"
    t.string   "visitor",          null: false
    t.string   "visitor_phone",    null: false
    t.string   "visitor_email"
    t.datetime "meeting",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "user_id",     null: false
    t.string  "address",     null: false
    t.string  "city",        null: false
    t.string  "state",       null: false
    t.integer "bedrooms",    null: false
    t.integer "bathrooms",   null: false
    t.string  "details"
    t.string  "zip_code"
    t.string  "photo"
    t.float   "latitude"
    t.float   "longitude"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                   default: "seller"
    t.string   "cell_phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
