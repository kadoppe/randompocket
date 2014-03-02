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

ActiveRecord::Schema.define(version: 20140302135005) do

  create_table "articles", force: true do |t|
    t.text    "url",         limit: 255
    t.integer "user_id"
    t.integer "item_id"
    t.boolean "read",                    default: false
    t.text    "title"
    t.boolean "can_display",             default: true
  end

  add_index "articles", ["item_id"], name: "index_articles_on_item_id"
  add_index "articles", ["user_id", "item_id"], name: "index_articles_on_user_id_and_item_id"
  add_index "articles", ["user_id", "read"], name: "index_articles_on_user_id_and_read"
  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "users", force: true do |t|
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                 default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "uid",                 limit: 8
    t.string   "name"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "token"
    t.boolean  "fetching"
  end

  add_index "users", ["token"], name: "index_users_on_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

end
