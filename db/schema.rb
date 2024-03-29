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

ActiveRecord::Schema.define(version: 20160321232838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.integer  "stage",       default: 1
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "vacant_id"
  end

  add_index "projects", ["vacant_id"], name: "index_projects_on_vacant_id", using: :btree

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string  "firstname",       limit: 255
    t.string  "lastname",        limit: 255
    t.boolean "isadmin",                     default: false, null: false
    t.boolean "isvolunteer",                 default: false, null: false
    t.string  "email"
    t.string  "password_digest"
    t.boolean "email_confirmed",             default: false
    t.string  "confirm_token"
  end

  create_table "vacants", id: :bigserial, force: :cascade do |t|
    t.string  "blocklot",        limit: 255
    t.string  "fulladdress",     limit: 255
    t.string  "neighborhood",    limit: 255
    t.integer "councildistrict"
    t.string  "policedistrict",  limit: 255
    t.point   "location_1"
    t.date    "noticedate"
  end

  add_foreign_key "projects", "vacants"
end
