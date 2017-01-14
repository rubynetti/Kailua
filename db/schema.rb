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

ActiveRecord::Schema.define(version: 20170114122455) do

  create_table "incomes", force: :cascade do |t|
    t.text     "description"
    t.date     "date_of_transaction"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "price_cents",         default: 0,     null: false
    t.string   "price_currency",      default: "EUR", null: false
  end

  create_table "outcomes", force: :cascade do |t|
    t.text     "description"
    t.date     "date_of_transaction"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "price_cents",         default: 0,     null: false
    t.string   "price_currency",      default: "EUR", null: false
  end

  create_table "socios", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "contact"
    t.string   "cf"
    t.integer  "number"
    t.boolean  "complete"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.date     "birthdate"
    t.string   "tel"
    t.date     "registration_date"
    t.string   "residence_place"
    t.string   "birth_place"
  end

  create_table "verbals", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.date     "document_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "authors"
  end

end
