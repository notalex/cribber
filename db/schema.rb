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

ActiveRecord::Schema.define(:version => 20120522022009) do

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tweeters", :force => true do |t|
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.string   "oauth_token"
    t.string   "oauth_verifier"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "token"
    t.string   "secret"
  end

  create_table "tweets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "retweet_count"
    t.string   "user_name"
    t.string   "user_screen_name"
    t.string   "retweeter_name"
    t.string   "retweeter_screen_name"
    t.string   "text"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "user_img_file_name"
    t.string   "user_img_content_type"
    t.integer  "user_img_file_size"
    t.datetime "user_img_updated_at"
    t.string   "tweet_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "twitter_id"
    t.string   "crypted_password"
    t.string   "email"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "salt"
    t.boolean  "is_admin",         :default => false
  end

end
