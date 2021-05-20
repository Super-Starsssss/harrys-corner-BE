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

ActiveRecord::Schema.define(version: 2021_05_13_035223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "name"
    t.boolean "check"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "location"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "class_rooms", force: :cascade do |t|
    t.string "name"
    t.boolean "delete_class_room"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "class_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "class_room_id", null: false
    t.boolean "delete_class_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["class_room_id"], name: "index_class_users_on_class_room_id"
    t.index ["user_id"], name: "index_class_users_on_user_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_collections_on_topic_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.bigint "collection_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collection_id"], name: "index_questions_on_collection_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_questions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activation_digest"
    t.datetime "activated_at"
    t.boolean "activated"
    t.date "birthday"
    t.string "phone_number"
    t.string "address"
    t.integer "role_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "class_users", "class_rooms"
  add_foreign_key "class_users", "users"
  add_foreign_key "collections", "topics"
  add_foreign_key "questions", "collections"
end
