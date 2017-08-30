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

ActiveRecord::Schema.define(version: 20170820125715) do

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

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.string   "name"
    t.text     "content"
    t.string   "picture"
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

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qnas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "content"
    t.string   "pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "recomments", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reqnas", force: :cascade do |t|
    t.integer  "qna_id"
    t.string   "content"
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
    t.integer  "user_id"
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
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "view_count",         default: 0
    t.integer  "click_count",        default: 0
    t.string   "s_site",             default: "false"
    t.string   "s_theme",            default: "false"
    t.string   "theme"
    t.text     "s_tag"
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
  end

  add_index "stores", ["cached_votes_down"], name: "index_stores_on_cached_votes_down"
  add_index "stores", ["cached_votes_score"], name: "index_stores_on_cached_votes_score"
  add_index "stores", ["cached_votes_total"], name: "index_stores_on_cached_votes_total"
  add_index "stores", ["cached_votes_up"], name: "index_stores_on_cached_votes_up"

  create_table "stores_tags", id: false, force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stores_tags", ["store_id"], name: "index_stores_tags_on_store_id"
  add_index "stores_tags", ["tag_id"], name: "index_stores_tags_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "count",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                                null: false
    t.string   "encrypted_password",     default: "",                                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                 null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "image",                  default: "/assets/OOU_one_img_default.png"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
