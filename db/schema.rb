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

ActiveRecord::Schema.define(version: 20140822174142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_ins", force: true do |t|
    t.integer  "day_id"
    t.integer  "user_id"
    t.integer  "term_id"
    t.boolean  "late"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", force: true do |t|
    t.string   "season"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "current_term"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
