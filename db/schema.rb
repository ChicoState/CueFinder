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

ActiveRecord::Schema.define(version: 20150728212814) do

  create_table "finders", force: :cascade do |t|
    t.string   "question",       limit: 255
    t.boolean  "noneEnabled",    limit: 1
    t.boolean  "multipleChoice", limit: 1
    t.boolean  "timed",          limit: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "finders_items", id: false, force: :cascade do |t|
    t.integer "finder_id", limit: 4, null: false
    t.integer "item_id",   limit: 4, null: false
  end

  add_index "finders_items", ["finder_id", "item_id"], name: "index_finders_items_on_finder_id_and_item_id", using: :btree
  add_index "finders_items", ["item_id", "finder_id"], name: "index_finders_items_on_item_id_and_finder_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "selections", force: :cascade do |t|
    t.integer  "item_id",   limit: 4
    t.integer  "finder_id", limit: 4
    t.datetime "timestamp"
    t.integer  "user_id",   limit: 4
    t.integer  "row",       limit: 4
    t.integer  "column",    limit: 4
  end

  add_index "selections", ["finder_id"], name: "index_selections_on_finder_id", using: :btree
  add_index "selections", ["item_id"], name: "index_selections_on_item_id", using: :btree
  add_index "selections", ["user_id"], name: "index_selections_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
