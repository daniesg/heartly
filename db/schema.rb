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

ActiveRecord::Schema.define(version: 2018_07_31_105952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calorie_restrictions", force: :cascade do |t|
    t.integer "max_calories"
    t.integer "min_calories"
    t.string "restrictable_type"
    t.bigint "restrictable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restrictable_type", "restrictable_id"], name: "index_calorie_restrictions_on_restrictable", unique: true
  end

  create_table "day_plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "user_id"], name: "index_day_plans_on_name", unique: true
    t.index ["user_id"], name: "index_day_plans_on_user_id"
  end

  create_table "day_plans_meal_plans", force: :cascade do |t|
    t.bigint "day_plan_id", null: false
    t.bigint "meal_plan_id", null: false
    t.index ["day_plan_id", "meal_plan_id"], name: "index_day_plans_meal_plans_on_main", unique: true
    t.index ["meal_plan_id"], name: "index_day_plans_meal_plans_on_meal_plan_id"
  end

  create_table "dish_plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "user_id"], name: "index_dish_plans_on_name", unique: true
    t.index ["user_id"], name: "index_dish_plans_on_user_id"
  end

  create_table "dish_restrictions", force: :cascade do |t|
    t.bigint "meal_plan_id"
    t.integer "min_dishes"
    t.integer "max_dishes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_plan_id"], name: "index_dish_restrictions_on_meal_plan_id", unique: true
  end

  create_table "ingredient_restrictions", force: :cascade do |t|
    t.string "ingredient_name"
    t.string "restrictable_type"
    t.bigint "restrictable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_name"], name: "index_ingredient_restrictions_on_ingredient_name"
    t.index ["restrictable_type", "restrictable_id", "ingredient_name"], name: "index_ingredient_restrictions_on_restrictable_and_ingredient", unique: true
  end

  create_table "meal_plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "user_id"], name: "index_meal_plans_on_name", unique: true
    t.index ["user_id"], name: "index_meal_plans_on_user_id"
  end

  create_table "meal_plans_dish_plans", force: :cascade do |t|
    t.bigint "meal_plan_id", null: false
    t.bigint "dish_plan_id", null: false
    t.index ["dish_plan_id"], name: "index_meal_plans_dish_plans_on_dish_plan_id"
    t.index ["meal_plan_id", "dish_plan_id"], name: "index_meal_plans_dish_plans_on_main", unique: true
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "user_id"], name: "index_plans_on_name", unique: true
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "plans_day_plans", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "day_plan_id", null: false
    t.index ["day_plan_id"], name: "index_plans_day_plans_on_day_plan_id"
    t.index ["plan_id", "day_plan_id"], name: "index_plans_day_plans_on_main", unique: true
  end

  create_table "tag_restrictions", force: :cascade do |t|
    t.string "tag", null: false
    t.string "restrictable_type"
    t.bigint "restrictable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restrictable_type", "restrictable_id", "tag"], name: "index_tag_restrictions_on_restrictable_and_tag", unique: true
    t.index ["tag"], name: "index_tag_restrictions_on_tag"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "day_plans", "users"
  add_foreign_key "day_plans_meal_plans", "day_plans"
  add_foreign_key "day_plans_meal_plans", "meal_plans"
  add_foreign_key "dish_plans", "users"
  add_foreign_key "meal_plans", "users"
  add_foreign_key "meal_plans_dish_plans", "dish_plans"
  add_foreign_key "meal_plans_dish_plans", "meal_plans"
  add_foreign_key "plans", "users"
  add_foreign_key "plans_day_plans", "day_plans"
  add_foreign_key "plans_day_plans", "plans"
end
