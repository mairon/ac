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

ActiveRecord::Schema.define(version: 20160121024725) do

  create_table "cities", force: :cascade do |t|
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "name",       limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",                limit: 50
    t.string   "telephone",           limit: 20
    t.string   "longitude",           limit: 20
    t.string   "latitude",            limit: 20
    t.integer  "city_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.text     "about"
    t.string   "address",             limit: 50
    t.string   "website",             limit: 150
    t.integer  "schedule_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name",    limit: 50
    t.string   "avatar_content_type", limit: 20
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "telephone02",         limit: 20
    t.integer  "currency_id"
    t.integer  "unit"
  end

  create_table "companies_currencies", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "currency_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

# Could not dump table "currencies" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "exchange_operations", force: :cascade do |t|
    t.integer  "exchange_id"
    t.integer  "company_id"
    t.integer  "have_id"
    t.integer  "want_id"
    t.integer  "operation"
    t.decimal  "amount",      precision: 15, scale: 4, default: 0.0
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "exchanges", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "currency_id"
    t.date     "date"
    t.decimal  "buy",         precision: 15, scale: 2, default: 0.0
    t.decimal  "sale",        precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "for"
  end

  create_table "schedules", force: :cascade do |t|
    t.time     "in"
    t.time     "to"
    t.string   "weekday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  create_table "standard_exchanges", force: :cascade do |t|
    t.integer  "currency_want"
    t.integer  "currency_have"
    t.integer  "operation"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.integer  "country_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
