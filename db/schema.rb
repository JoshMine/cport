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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130521054806) do

  create_table "contact_data", :force => true do |t|
    t.string   "email"
    t.string   "m_phone"
    t.string   "h_phone"
    t.string   "f_address"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "participant_id"
  end

  create_table "participants", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "portfolio_id"
    t.string   "gender"
    t.date     "date_birth"
    t.string   "m_phone"
    t.string   "h_phone"
    t.string   "f_address"
    t.integer  "rating"
    t.integer  "index"
  end

  create_table "passports", :force => true do |t|
    t.integer  "participant_id"
    t.integer  "series"
    t.integer  "number"
    t.string   "issuer"
    t.string   "dep_code"
    t.date     "issue_date"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "gender"
    t.date     "birth_date"
    t.string   "birth_place"
    t.string   "marrital_status"
    t.string   "official_address"
    t.string   "doc_file_file_name"
    t.string   "doc_file_content_type"
    t.integer  "doc_file_file_size"
    t.datetime "doc_file_updated_at"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "people", :force => true do |t|
    t.integer  "portfolio_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
  end

  create_table "portfolios", :force => true do |t|
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.boolean  "confirm"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
