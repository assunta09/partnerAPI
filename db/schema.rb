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

ActiveRecord::Schema.define(version: 20160925172233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balances", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "year"
    t.integer  "total_assets"
    t.integer  "total_liabilities"
    t.integer  "net_assets"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.integer "subsection_code"
    t.integer "classification_code"
    t.text    "description"
  end

  create_table "executives", force: :cascade do |t|
    t.integer  "organisation_id"
    t.string   "name"
    t.string   "title"
    t.integer  "salary"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "year"
    t.integer  "grants"
    t.integer  "member_benefits"
    t.integer  "salaries"
    t.integer  "fundraising_fees"
    t.integer  "other"
    t.integer  "total"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.text     "mission"
    t.string   "organisation_type"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "year_formed"
    t.integer  "number_of_employees"
    t.string   "domain"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "revenues", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "year"
    t.integer  "contributions"
    t.integer  "service_revenue"
    t.integer  "investments"
    t.integer  "other"
    t.integer  "total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
