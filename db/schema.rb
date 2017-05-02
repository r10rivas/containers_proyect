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

ActiveRecord::Schema.define(version: 20170502013435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "country_id"
    t.string   "street"
    t.string   "description"
    t.boolean  "current"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_addresses_on_company_id", using: :btree
    t.index ["country_id"], name: "index_addresses_on_country_id", using: :btree
  end

  create_table "bls", force: :cascade do |t|
    t.string   "cod_bl"
    t.integer  "organization_id"
    t.integer  "consignee_id"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.date     "date_arrive"
    t.boolean  "is_master",       default: false
    t.integer  "bl_master_id"
    t.integer  "travel_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["bl_master_id"], name: "index_bls_on_bl_master_id", using: :btree
    t.index ["consignee_id"], name: "index_bls_on_consignee_id", using: :btree
    t.index ["destination_id"], name: "index_bls_on_destination_id", using: :btree
    t.index ["organization_id"], name: "index_bls_on_organization_id", using: :btree
    t.index ["origin_id"], name: "index_bls_on_origin_id", using: :btree
    t.index ["travel_id"], name: "index_bls_on_travel_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind_of_doc"
    t.string   "num_doc"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "nvocc"
  end

  create_table "containers", force: :cascade do |t|
    t.string   "code"
    t.integer  "kind_of_container"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_emails_on_company_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_organizations_on_company_id", using: :btree
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "num_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_phones_on_company_id", using: :btree
  end

  create_table "ports", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_ports_on_country_id", using: :btree
  end

  create_table "ships", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_ships_on_owner_id", using: :btree
  end

  create_table "travels", force: :cascade do |t|
    t.string   "cod_travel"
    t.integer  "ship_id"
    t.integer  "destination_id"
    t.integer  "origin_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["destination_id"], name: "index_travels_on_destination_id", using: :btree
    t.index ["origin_id"], name: "index_travels_on_origin_id", using: :btree
    t.index ["ship_id"], name: "index_travels_on_ship_id", using: :btree
  end

  add_foreign_key "addresses", "companies"
  add_foreign_key "addresses", "countries"
  add_foreign_key "bls", "organizations"
  add_foreign_key "bls", "travels"
  add_foreign_key "emails", "companies"
  add_foreign_key "organizations", "companies"
  add_foreign_key "phones", "companies"
  add_foreign_key "ports", "countries"
  add_foreign_key "travels", "ships"
end
