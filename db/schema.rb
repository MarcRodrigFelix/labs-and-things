# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_22_041917) do

  create_table "appointments", force: :cascade do |t|
    t.string "type_of_appt"
    t.string "time_of_appt"
    t.integer "user_id", null: false
    t.integer "laboratory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "appt_date"
    t.index ["laboratory_id"], name: "index_appointments_on_laboratory_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
    t.string "lab_type"
    t.integer "phone_number"
    t.string "address"
    t.time "hours"
    t.string "days_of_operation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "date_of_birth"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "laboratories"
  add_foreign_key "appointments", "users"
end
