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

ActiveRecord::Schema.define(version: 20200721070023) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "postal_code",           limit: 7, null: false
    t.string   "prefectures",                     null: false
    t.string   "ctiy",                            null: false
    t.string   "block_number",                    null: false
    t.string   "apartment_name"
    t.integer  "user_id",                         null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "ship_family_name",                null: false
    t.string   "ship_first_name",                 null: false
    t.string   "ship_family_name_kana",           null: false
    t.string   "ship_first_name_kana",            null: false
    t.string   "telephone"
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "credit_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id", using: :btree
  end

  create_table "deals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_deals_on_item_id", using: :btree
    t.index ["user_id"], name: "index_deals_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",    null: false
    t.string   "image_url",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                            null: false
    t.text     "description",       limit: 65535, null: false
    t.string   "brand"
    t.integer  "condition",                       null: false
    t.integer  "delivery_fee",                    null: false
    t.integer  "delivery_regions",                null: false
    t.integer  "shipping_schedule",               null: false
    t.integer  "price",                           null: false
    t.integer  "user_id",                         null: false
    t.integer  "category_id",                     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image"
    t.string   "nickname",                            null: false
    t.string   "family_name",                         null: false
    t.string   "first_name",                          null: false
    t.string   "family_name_kana",                    null: false
    t.string   "first_name_kana",                     null: false
    t.integer  "birth_year",                          null: false
    t.integer  "birth_month",                         null: false
    t.integer  "birth_day",                           null: false
    t.string   "phone_num"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "deals", "items"
  add_foreign_key "deals", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
end
