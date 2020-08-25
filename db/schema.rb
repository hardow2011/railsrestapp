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

ActiveRecord::Schema.define(version: 3) do

  create_table "pictures", force: :cascade do |t|
    t.text "base64Picture"
    t.integer "registry_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registry_id"], name: "index_pictures_on_registry_id"
  end

  create_table "registries", force: :cascade do |t|
    t.string "name"
    t.string "educationLevel"
    t.float "latitude"
    t.float "longitude"
    t.integer "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_registries_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "userName"
    t.string "password"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pictures", "registries"
  add_foreign_key "registries", "users", column: "users_id"
end
