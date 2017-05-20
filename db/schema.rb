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

ActiveRecord::Schema.define(version: 20170520094030) do

  create_table "adpics", force: :cascade do |t|
    t.string   "title"
    t.string   "sub_title"
    t.integer  "store_id"
    t.string   "pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ads", force: :cascade do |t|
    t.string   "ad_title"
    t.string   "ad_content"
    t.string   "store_id"
    t.string   "ad_store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foodtypes", force: :cascade do |t|
    t.string   "chicken"
    t.string   "chinese"
    t.string   "korean"
    t.string   "japanese"
    t.string   "pizzaburger"
    t.string   "taco"
    t.string   "night"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "m_name"
    t.integer  "m_price"
    t.string   "m_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "r_pic"
    t.string   "store_id"
    t.string   "r_text"
    t.integer  "r_deliverytime"
    t.string   "r_nickname"
    t.integer  "r_gingko"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "s_pic"
    t.string   "s_location"
    t.string   "s_deliverytime"
    t.string   "s_time"
    t.string   "s_card"
    t.string   "s_min"
    t.integer  "s_deliver_ok"
    t.integer  "s_card_ok"
    t.integer  "s_divide_ok"
    t.string   "s_name"
    t.string   "s_intro"
    t.string   "s_number"
    t.string   "s_type"
    t.string   "s_menu_pic"
    t.string   "s_menu_pic2"
    t.string   "s_menu_pic3"
    t.string   "s_menu_pic4"
    t.string   "s_menu_pic5"
    t.string   "s_menu_pic6"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "view_count",     default: 0
    t.integer  "click_count",    default: 0
    t.string   "s_site",         default: "false"
    t.string   "s_theme"
    t.string   "theme"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
