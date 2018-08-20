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

ActiveRecord::Schema.define(version: 2018_08_14_224832) do

  create_table "anamneses", force: :cascade do |t|
    t.boolean "boolean_example", default: false
    t.boolean "boolean_exampletwo"
    t.integer "integer_example", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_anamneses_on_user_id"
  end

  create_table "exames", force: :cascade do |t|
    t.string "tipo"
    t.integer "anamnese_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anamnese_id"], name: "index_exames_on_anamnese_id"
  end

  create_table "updates", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "anamneses_update"
    t.datetime "example_update"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_updates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", null: false
    t.string "nickname"
    t.string "image"
    t.string "email", null: false
    t.datetime "birth_day", null: false
    t.string "address"
    t.boolean "is_admin", default: false
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index [nil], name: "index_users_on_confirmation_token", unique: true
  end

end
