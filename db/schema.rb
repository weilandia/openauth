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

ActiveRecord::Schema[7.0].define(version: 2022_07_14_211241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "organizations", force: :cascade do |t|
    t.citext "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_organizations_on_name", unique: true
  end

  create_table "rosters", force: :cascade do |t|
    t.citext "name", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "organization_id"], name: "unique_roster_names_on_organization", unique: true
    t.index ["organization_id"], name: "index_rosters_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.citext "email"
    t.citext "phone_number"
    t.citext "first_name"
    t.citext "middle_name"
    t.citext "last_name"
    t.boolean "pending", default: false
    t.bigint "roster_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email", "roster_id"], name: "unique_emails_on_roster", unique: true
    t.index ["phone_number", "roster_id"], name: "unique_phone_numbers_on_roster", unique: true
    t.index ["roster_id"], name: "index_users_on_roster_id"
  end

  add_foreign_key "rosters", "organizations", on_delete: :cascade
  add_foreign_key "users", "rosters", on_delete: :cascade
end
