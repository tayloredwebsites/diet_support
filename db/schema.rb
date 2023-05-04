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

ActiveRecord::Schema[7.0].define(version: 2023_04_22_165418) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ff_food_nutrients", force: :cascade do |t|
    t.integer "fdc_id", null: false
    t.integer "nutrient_id"
    t.integer "usda_nutrient_id", null: false
    t.integer "usda_nutrient_num"
    t.float "amount"
    t.integer "data_points"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fdc_id"], name: "ix_ff_food_nutrients_on_fdc_id"
    t.index ["nutrient_id"], name: "ix_ff_food_nutrients_on_nutrient"
    t.index ["usda_nutrient_id"], name: "ix_ff_food_nutrients_on_usda_nutrient"
    t.index ["usda_nutrient_num"], name: "ix_ff_food_nutrients_on_usda_nutrient_num"
  end

  create_table "ff_foods", force: :cascade do |t|
    t.string "name", default: ""
    t.integer "fdc_id"
    t.integer "usda_food_cat_id"
    t.integer "wweia_food_cat_id"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_nutrients", force: :cascade do |t|
    t.integer "food_id", null: false
    t.integer "nutrient_id", null: false
    t.float "amount"
    t.boolean "active", default: true
    t.float "variance"
    t.text "samples_json", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "ix_food_nutrients_on_food"
    t.index ["nutrient_id"], name: "ix_food_nutrients_on_nutrient"
  end

  create_table "food_portion_grams", force: :cascade do |t|
    t.integer "food_id", null: false
    t.string "portion_unit", null: false
    t.float "portion_grams", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id", "portion_unit"], name: "ix_food_portion_grams_on_food_portion_unit"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "food_portion_unit", default: "G", null: false
    t.float "food_portion_amount", default: 100.0, null: false
    t.integer "usda_food_cat_id"
    t.integer "wweia_food_cat_id"
    t.text "usda_fdc_ids_json"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "ix_foods_on_name", unique: true
    t.index ["usda_food_cat_id"], name: "ix_foods_on_usda_cat"
    t.index ["wweia_food_cat_id"], name: "ix_foods_on_wweia_cat"
  end

  create_table "lookup_tables", force: :cascade do |t|
    t.string "lu_table"
    t.integer "lu_id"
    t.string "lu_code", default: "", null: false
    t.text "lu_desc", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lu_code"], name: "ix_lookup_tables_on_lu_code"
    t.index ["lu_table", "lu_code"], name: "ix_lookup_tables_on_lu_table_lu_code", unique: true
    t.index ["lu_table"], name: "ix_lookup_tables_on_lu_table"
  end

  create_table "nutrients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "usda_nutrient_id", null: false
    t.string "usda_nutrient_num", limit: 8, null: false
    t.integer "use_this_id"
    t.boolean "active", default: true, null: false
    t.string "unit_code", limit: 8, null: false
    t.float "rda"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "unit_code"], name: "ix_nutrients_on_name_and_unit_code", unique: true
    t.index ["usda_nutrient_id"], name: "ix_nutrients_on_usda_nutrient_id"
    t.index ["usda_nutrient_num"], name: "ix_nutrients_on_usda_nutrient_num"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username"
    t.string "full_name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
