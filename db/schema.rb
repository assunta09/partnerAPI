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


ActiveRecord::Schema.define(version: 20160925200716) do

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

  create_table "contributiongrants", force: :cascade do |t|
    t.integer  "membership_fees"
    t.integer  "campaigns"
    t.integer  "fundraising"
    t.integer  "related_organisations"
    t.integer  "government_grants"
    t.integer  "other_gifts_or_donations"
    t.integer  "total"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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
    t.integer  "grant_id"
    t.integer  "member_benefits"
    t.integer  "salary_id"
    t.integer  "fundraising_fees"
    t.integer  "other_expense_id"
    t.integer  "total"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "grants", force: :cascade do |t|
    t.integer  "domestic_organisations"
    t.integer  "domestic_individuals"
    t.integer  "foreign_entities"
    t.integer  "total"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "masterfiles", force: :cascade do |t|

    t.integer "ein"
    t.integer "subsection_code"
    t.integer "classification_codes"
    t.integer "classification_id"
    t.integer "affiliation_code"
    t.integer "activity_codes"
    t.integer "organization_code"

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer  "ein"
    t.integer  "masterfile_id"
  end

  create_table "otherexpenses", force: :cascade do |t|
    t.integer  "lobbying"
    t.integer  "advertising_promotion"
    t.integer  "travel"
    t.integer  "entertainment"
    t.integer  "insurance"
    t.integer  "other"
    t.integer  "total"

    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false

    t.integer  "management"
    t.integer  "legal_fees"
    t.integer  "accounting"
    t.integer  "office_expenses"
    t.integer  "information_technology"
    t.integer  "royalties"
    t.integer  "conventions_and_meetings"
    t.integer  "occupancy"
  end

  create_table "programserviceaccomplishments", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "expense_amount"
    t.integer  "grant_amount"
    t.integer  "revenues"
    t.text     "description"
    t.integer  "year"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "revenues", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "year"
    t.integer  "contribution_grant_id"
    t.integer  "service_revenue"
    t.integer  "investments"
    t.integer  "other"
    t.integer  "total"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.integer  "officers_and_key_employees"
    t.integer  "general_salaries_and_wages"
    t.integer  "employee_benefits"
    t.integer  "payroll_taxes"
    t.integer  "other_compensation"
    t.integer  "total"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
