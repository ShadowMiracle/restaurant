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

ActiveRecord::Schema.define(version: 20161014185122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.text     "comment_text"
    t.integer  "star",         default: 0
    t.integer  "food_item_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["food_item_id"], name: "index_comments_on_food_item_id", using: :btree
  end

  create_table "food_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.string   "image_url"
    t.integer  "section_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "impressions_count", default: 0
    t.index ["section_id"], name: "index_food_items_on_section_id", using: :btree
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
    t.index ["user_id"], name: "index_impressions_on_user_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "food_item_id"
    t.integer  "order_id"
    t.integer  "unit_price"
    t.integer  "quantity"
    t.integer  "total_price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.decimal  "discount"
    t.index ["food_item_id"], name: "index_order_items_on_food_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "subtotal"
    t.integer  "shipping"
    t.integer  "total"
    t.string   "order_name"
    t.string   "order_phone_number"
    t.text     "order_address"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sections_on_name", using: :btree
  end

  add_foreign_key "comments", "food_items"
  add_foreign_key "food_items", "sections"
  add_foreign_key "order_items", "food_items"
  add_foreign_key "order_items", "orders"
end
