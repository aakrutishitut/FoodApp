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

ActiveRecord::Schema.define(version: 20181011095745) do

  create_table "ItemMenuJoin", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "item_id"
    t.integer  "menu_id"
    t.integer  "quantity"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_ItemMenuJoin_on_item_id", using: :btree
    t.index ["menu_id"], name: "index_ItemMenuJoin_on_menu_id", using: :btree
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
  end

  create_table "currents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "quantity"
    t.float    "amount",        limit: 24
    t.integer  "menu_item_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "restaurant_id"
    t.index ["menu_item_id"], name: "index_currents_on_menu_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "amount"
    t.integer  "order_id"
    t.integer  "menu_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
    t.index ["menu_item_id"], name: "index_items_on_menu_item_id", using: :btree
    t.index ["order_id"], name: "index_items_on_order_id", using: :btree
    t.index ["restaurant_id"], name: "fk_rails_eb27310cfa", using: :btree
  end

  create_table "menu_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.float    "amount",        limit: 24
    t.integer  "restaurant_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "order_time"
    t.string   "status"
    t.string   "payment_mode"
    t.float    "total",         limit: 24
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "restaurants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "location"
    t.boolean  "vegetarian_tag"
    t.integer  "rate_for_two"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.string   "avatar"
    t.string   "image"
    t.integer  "city_id"
    t.index ["city_id"], name: "fk_rails_84a6c1e563", using: :btree
    t.index ["user_id"], name: "index_restaurants_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "rating"
    t.text     "comment",       limit: 65535
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.index ["restaurant_id"], name: "fk_rails_8173017a90", using: :btree
    t.index ["user_id"], name: "fk_rails_74a66bd6c5", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "name"
    t.text     "home_add",               limit: 65535
    t.text     "work_add",               limit: 65535
    t.string   "typeofu"
    t.string   "avatar"
    t.string   "phone_no"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "items", "restaurants"
  add_foreign_key "restaurants", "cities"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
