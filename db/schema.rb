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

ActiveRecord::Schema.define(version: 20160928042228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balances", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "year"
    t.bigint   "total_assets",      default: 0
    t.bigint   "total_liabilities", default: 0
    t.bigint   "net_assets",        default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.integer "subsection_code"
    t.integer "classification_code"
    t.text    "description"
  end

  create_table "contributions", force: :cascade do |t|
    t.integer  "membership_fees"
    t.integer  "campaigns"
    t.integer  "fundraising",              default: 0
    t.integer  "related_organisations",    default: 0
    t.integer  "government_grants",        default: 0
    t.integer  "other_gifts_or_donations", default: 0
    t.integer  "total",                    default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "executives", force: :cascade do |t|
    t.integer  "organisation_id"
    t.string   "name"
    t.string   "title"
    t.integer  "salary",          default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "other_salary",    default: 0
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "year"
    t.integer  "grant_id"
    t.integer  "member_benefits",  default: 0
    t.integer  "salary_id"
    t.integer  "fundraising_fees", default: 0
    t.integer  "other_expense_id"
    t.integer  "total"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "grants", force: :cascade do |t|
    t.integer  "domestic_organisations", default: 0
    t.integer  "domestic_individuals",   default: 0
    t.integer  "foreign_entities",       default: 0
    t.integer  "total",                  default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "masterfiles", force: :cascade do |t|
    t.string  "ein"
    t.integer "subsection_code"
    t.integer "classification_codes"
    t.integer "classification_id"
    t.integer "affiliation_code"
    t.string  "activity_codes"
    t.integer "organization_code"
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.text     "mission"
    t.string   "address",                          array: true
    t.integer  "year_formed"
    t.integer  "number_of_employees"
    t.string   "domain"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "ein"
    t.integer  "masterfile_id"
  end

  create_table "other_expenses", force: :cascade do |t|
    t.integer  "lobbying",                 default: 0
    t.integer  "advertising_promotion",    default: 0
    t.integer  "travel",                   default: 0
    t.integer  "entertainment",            default: 0
    t.integer  "insurance",                default: 0
    t.integer  "other",                    default: 0
    t.integer  "total",                    default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "management",               default: 0
    t.integer  "legal_fees",               default: 0
    t.integer  "accounting",               default: 0
    t.integer  "office_expenses",          default: 0
    t.integer  "information_technology",   default: 0
    t.integer  "royalties",                default: 0
    t.integer  "conventions_and_meetings", default: 0
    t.integer  "occupancy",                default: 0
  end

  create_table "program_service_accomplishments", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "expense_amount",  default: 0
    t.integer  "grant_amount",    default: 0
    t.integer  "revenues",        default: 0
    t.text     "description"
    t.integer  "year"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "revenues", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "year"
    t.integer  "contribution_id"
    t.integer  "service_revenue", default: 0
    t.integer  "investments",     default: 0
    t.integer  "other",           default: 0
    t.integer  "total",           default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.integer  "officers_and_key_employees", default: 0
    t.integer  "general_salaries_and_wages", default: 0
    t.integer  "employee_benefits",          default: 0
    t.integer  "payroll_taxes",              default: 0
    t.integer  "pension_plan_accruals",      default: 0
    t.integer  "total",                      default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "disqual_persons"
  end

end
