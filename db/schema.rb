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

ActiveRecord::Schema.define(version: 20170328165659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "v1_answers", force: :cascade do |t|
    t.text     "ansdata"
    t.text     "ref"
    t.integer  "v1_question_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["v1_question_id"], name: "index_v1_answers_on_v1_question_id", using: :btree
  end

  create_table "v1_categories", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "v1_forms", force: :cascade do |t|
    t.text     "title"
    t.text     "details"
    t.integer  "banksize"
    t.integer  "questions_count"
    t.integer  "visits_count"
    t.integer  "reports_count"
    t.integer  "v1_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["v1_category_id"], name: "index_v1_forms_on_v1_category_id", using: :btree
  end

  create_table "v1_questions", force: :cascade do |t|
    t.text     "questdata"
    t.integer  "v1_form_id"
    t.integer  "v1_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["v1_form_id"], name: "index_v1_questions_on_v1_form_id", using: :btree
    t.index ["v1_type_id"], name: "index_v1_questions_on_v1_type_id", using: :btree
  end

  create_table "v1_reports", force: :cascade do |t|
    t.string   "email"
    t.text     "debrief"
    t.integer  "v1_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["v1_form_id"], name: "index_v1_reports_on_v1_form_id", using: :btree
  end

  create_table "v1_types", force: :cascade do |t|
    t.string   "alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "v1_answers", "v1_questions"
  add_foreign_key "v1_forms", "v1_categories"
  add_foreign_key "v1_questions", "v1_forms"
  add_foreign_key "v1_questions", "v1_types"
  add_foreign_key "v1_reports", "v1_forms"
end
