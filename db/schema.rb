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

ActiveRecord::Schema.define(version: 20170314140105) do

  create_table "invoice_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "price",      limit: 24
    t.integer  "amount"
    t.integer  "item_id"
    t.integer  "invoice_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["invoice_id"], name: "index_invoice_details_on_invoice_id", using: :btree
    t.index ["item_id"], name: "index_invoice_details_on_item_id", using: :btree
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "total",      limit: 24
    t.boolean  "delivered"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "amount"
    t.float    "price",      limit: 24
    t.string   "eastsun_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "purchases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.float    "price",      limit: 24
    t.integer  "amount"
    t.date     "date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["item_id"], name: "index_purchases_on_item_id", using: :btree
  end

  add_foreign_key "invoice_details", "invoices"
  add_foreign_key "invoice_details", "items"
  add_foreign_key "purchases", "items"
end
