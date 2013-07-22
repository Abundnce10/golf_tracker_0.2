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

ActiveRecord::Schema.define(:version => 20130722050008) do

  create_table "addresses", :force => true do |t|
    t.integer  "state_id"
    t.string   "street"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "city_id"
    t.integer  "zipcode_id"
  end

  create_table "approach_details", :force => true do |t|
    t.integer  "played_hole_id"
    t.integer  "shot_number"
    t.integer  "distance_from_hole"
    t.boolean  "on_green"
    t.boolean  "in_the_hole"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "OB"
    t.boolean  "sand"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
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
    t.string   "name"
  end

  create_table "drive_details", :force => true do |t|
    t.integer  "played_hole_id"
    t.integer  "distance_of_drive"
    t.boolean  "on_fairway"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "OB"
    t.boolean  "sand"
  end

  create_table "fairways", :force => true do |t|
    t.string   "fairway_accuracy"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
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
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "handicaps", :force => true do |t|
    t.integer  "hole_id"
    t.integer  "gender_id"
    t.integer  "handicap"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hole_notes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "round_id"
    t.integer  "hole_id"
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "holes", :force => true do |t|
    t.integer  "course_id"
    t.integer  "tee_id"
    t.integer  "number"
    t.integer  "distance"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pars", :force => true do |t|
    t.integer  "hole_id"
    t.integer  "gender_id"
    t.integer  "par"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "played_holes", :force => true do |t|
    t.integer  "round_id"
    t.integer  "hole_id"
    t.integer  "fairway_id"
    t.integer  "GIR"
    t.integer  "putts"
    t.integer  "bunker"
    t.integer  "OB"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "strokes"
    t.integer  "scramble"
  end

  create_table "putt_details", :force => true do |t|
    t.string   "played_hole_id"
    t.integer  "shot_number"
    t.integer  "distance_from_hole"
    t.boolean  "make"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "round_notes", :force => true do |t|
    t.integer  "round_id"
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "round_summaries", :force => true do |t|
    t.integer  "round_id"
    t.integer  "score_summary_id"
    t.integer  "total_strokes"
    t.integer  "front_9_strokes"
    t.integer  "back_9_strokes"
    t.integer  "fairways_hit"
    t.integer  "fairways_possible"
    t.integer  "GIRs_hit"
    t.integer  "GIRs_possible"
    t.integer  "total_putts"
    t.integer  "front_9_putts"
    t.integer  "back_9_putts"
    t.decimal  "scrambling_percentage"
    t.integer  "sand_shots"
    t.integer  "OBs"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "rounds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "tee_id"
    t.date     "date_played"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "score_summaries", :force => true do |t|
    t.integer  "hole_in_ones"
    t.integer  "double_eagles"
    t.integer  "eagles"
    t.integer  "birdies"
    t.integer  "pars"
    t.integer  "bogies"
    t.integer  "double_bogies"
    t.integer  "triple_bogies"
    t.integer  "quad_plus_bogies"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
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

  create_table "zipcodes", :force => true do |t|
    t.integer  "zipcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
