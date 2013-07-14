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

ActiveRecord::Schema.define(:version => 20130714011805) do

  create_table "addresses", :force => true do |t|
    t.integer  "state_id"
    t.string   "street"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "rating"
    t.text     "review"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_types", :force => true do |t|
    t.string   "course_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "courses", :force => true do |t|
    t.integer  "address_id"
    t.integer  "course_type_id"
    t.integer  "fee_id"
    t.integer  "season_id"
    t.string   "website"
    t.string   "phone_number"
    t.integer  "number_of_holes"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "fees", :force => true do |t|
    t.float    "weekday_18"
    t.float    "weekday_9"
    t.float    "weekend_18"
    t.float    "weekend_9"
    t.float    "twilight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "genders", :force => true do |t|
    t.string   "gender_type"
    t.string   "gender_tees"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "round_notes", :force => true do |t|
    t.integer  "round_id"
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rounds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "tee_id"
    t.date     "date_played"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "seasons", :force => true do |t|
    t.string   "seasonality"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "slope_ratings", :force => true do |t|
    t.integer  "tee_id"
    t.integer  "gender_id"
    t.integer  "course_id"
    t.integer  "slope"
    t.float    "rating"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tees", :force => true do |t|
    t.string   "tee_type"
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
