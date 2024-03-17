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

ActiveRecord::Schema[7.0].define(version: 2024_02_29_033537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["title"], name: "index_articles_on_title", unique: true
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "title"
    t.string "link_to"
    t.boolean "has_sub_menu", default: false, null: false
    t.boolean "is_root", default: false, null: false
    t.integer "index_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_to"], name: "index_menus_on_link_to", unique: true
    t.index ["title"], name: "index_menus_on_title", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "work_group_id"
    t.boolean "is_active", default: false, null: false
    t.string "title", null: false
    t.boolean "is_root", default: false, null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_profiles_on_title", unique: true
    t.index ["work_group_id"], name: "index_profiles_on_work_group_id"
  end

  create_table "role_profiles", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_role_profiles_on_profile_id"
    t.index ["role_id"], name: "index_role_profiles_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
    t.boolean "is_root", default: false, null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_menus", force: :cascade do |t|
    t.string "title"
    t.string "link_to"
    t.boolean "has_sub_menu", default: false, null: false
    t.integer "index_order"
    t.bigint "menus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menus_id"], name: "index_sub_menus_on_menus_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_user_profiles_on_profile_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false, null: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "work_groups", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "users"
  add_foreign_key "sub_menus", "menus", column: "menus_id"
  add_foreign_key "user_profiles", "profiles"
  add_foreign_key "user_profiles", "users"
end
