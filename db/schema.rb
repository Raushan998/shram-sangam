# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_07_06_142215) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "landmark"
    t.string "street"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
    t.index ["country", "city"], name: "index_addresses_on_country_and_city"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string "business_name"
    t.integer "business_type"
    t.text "business_description"
    t.string "addr1"
    t.string "add2"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.string "phone_number"
    t.string "country_code", default: "+91"
    t.string "country"
    t.string "email_address"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.string "phone_number"
    t.string "country_code", default: "+91"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "message"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone_number"
    t.string "country_code", default: "+91"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "country_code", default: "+91"
    t.string "addr1"
    t.string "addr2"
    t.string "city"
    t.string "pincode"
    t.string "state"
    t.string "country"
    t.string "email"
    t.text "description"
    t.integer "work_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_workers_on_city"
    t.index ["email"], name: "index_workers_on_email"
    t.index ["phone_number"], name: "index_workers_on_phone_number"
    t.index ["pincode"], name: "index_workers_on_pincode"
    t.index ["state"], name: "index_workers_on_state"
    t.index ["work_type"], name: "index_workers_on_work_type"
  end

  create_table "works", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.integer "budget_type"
    t.float "budget_amount"
    t.integer "work_type"
    t.integer "category"
    t.integer "post_visibility"
    t.integer "required_workers"
    t.string "contact_person_name"
    t.string "contact_person_phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
