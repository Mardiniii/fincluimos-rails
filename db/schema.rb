# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160418045604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "form_responses", force: :cascade do |t|
    t.integer  "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "form_responses", ["form_id"], name: "index_form_responses_on_form_id", using: :btree

  create_table "forms", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.text     "description"
    t.integer  "form_responses_count", default: 0
  end

  add_index "forms", ["company_id"], name: "index_forms_on_company_id", using: :btree

  create_table "question_option_question_responses", force: :cascade do |t|
    t.integer  "question_option_id"
    t.integer  "question_response_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "question_option_question_responses", ["question_option_id"], name: "index_qo_qr", using: :btree
  add_index "question_option_question_responses", ["question_response_id"], name: "index_qr_qo", using: :btree

  create_table "question_options", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_options", ["question_id"], name: "index_question_options_on_question_id", using: :btree

  create_table "question_responses", force: :cascade do |t|
    t.integer  "form_response_id"
    t.integer  "question_id"
    t.integer  "question_option_id"
    t.text     "text"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "question_responses", ["form_response_id"], name: "index_question_responses_on_form_response_id", using: :btree
  add_index "question_responses", ["question_id"], name: "index_question_responses_on_question_id", using: :btree
  add_index "question_responses", ["question_option_id"], name: "index_question_responses_on_question_option_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "form_id"
    t.integer  "question_type"
    t.text     "text"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "questions", ["form_id"], name: "index_questions_on_form_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.integer  "company_id"
    t.string   "auth_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "id_number"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "form_responses", "forms"
  add_foreign_key "forms", "companies"
  add_foreign_key "question_option_question_responses", "question_options"
  add_foreign_key "question_option_question_responses", "question_responses"
  add_foreign_key "question_options", "questions"
  add_foreign_key "question_responses", "form_responses"
  add_foreign_key "question_responses", "question_options"
  add_foreign_key "question_responses", "questions"
  add_foreign_key "questions", "forms"
end
