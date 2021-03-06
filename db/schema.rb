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

ActiveRecord::Schema.define(version: 20141014090839) do

  create_table "identities", force: true do |t|
    t.string   "classification"
    t.integer  "sei_fee"
    t.integer  "sei_eds_fee"
    t.integer  "sei_ebsd_fee"
    t.integer  "sei_eds_ebsd_fee"
    t.float    "discount_above_30k"
    t.float    "discount_above_40k"
    t.float    "discount_above_60k"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.integer  "org_id"
    t.string   "tel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "email"
    t.integer  "sei_bei_license_cd"
    t.integer  "eds_license_cd"
    t.integer  "ebsd_license_cd"
  end

  add_index "members", ["org_id"], name: "index_members_on_org_id"
  add_index "members", ["user_id"], name: "index_members_on_user_id"

  create_table "office_hrs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "time_00_09_cd", default: 1
    t.integer  "time_09_12_cd", default: 3
    t.integer  "time_12_14_cd", default: 2
    t.integer  "time_14_17_cd", default: 3
    t.integer  "time_17_20_cd", default: 1
    t.integer  "time_20_24_cd", default: 1
  end

  create_table "orgs", force: true do |t|
    t.string   "name"
    t.string   "official_name"
    t.string   "address"
    t.string   "tel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.integer  "identity_id"
  end

  add_index "orgs", ["identity_id"], name: "index_orgs_on_identity_id"

  create_table "records", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.integer  "org_id"
    t.float    "sei_hr"
    t.float    "sei_eds_hr"
    t.float    "sei_ebsd_hr"
    t.float    "sei_eds_ebsd_hr"
    t.boolean  "payment_notice"
    t.boolean  "paid"
    t.text     "note"
    t.float    "sum_price"
  end

  add_index "records", ["member_id"], name: "index_records_on_member_id"
  add_index "records", ["org_id"], name: "index_records_on_org_id"

  create_table "reservations", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "section_type"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sei",          default: true
    t.boolean  "bei"
    t.boolean  "eds"
    t.boolean  "ebsd"
  end

  add_index "reservations", ["member_id"], name: "index_reservations_on_member_id"

  create_table "time_sections", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "operator_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
