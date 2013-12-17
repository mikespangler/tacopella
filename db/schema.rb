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

ActiveRecord::Schema.define(version: 20131217221218) do

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.integer  "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
  end

  create_table "scores", force: true do |t|
    t.string  "name"
    t.integer "value"
    t.integer "challenge_id"
  end

  create_table "songs", force: true do |t|
    t.string   "name"
    t.integer  "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "play_key"
  end

  create_table "user_challenges", force: true do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
  end

end
