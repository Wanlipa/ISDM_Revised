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

ActiveRecord::Schema.define(version: 20180619072444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapter_outcomes", force: :cascade do |t|
    t.bigint "course_id"
    t.string "chname"
    t.string "outcome"
    t.bigint "chapter_id"
    t.bigint "outcome_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_chapter_outcomes_on_chapter_id"
    t.index ["outcome_id"], name: "index_chapter_outcomes_on_outcome_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "time"
    t.index ["course_id"], name: "index_chapters_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "about_course"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "effort"
    t.string "price"
    t.string "institution"
    t.string "subject"
    t.string "level"
    t.string "languages"
    t.string "videots"
    t.string "prerequisites"
    t.string "courseName"
    t.string "avatar"
    t.string "status"
    t.bigint "category_id"
    t.string "outcome"
    t.string "evaluation"
    t.integer "length"
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "about_me"
    t.string "institute"
    t.string "avatar"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_instructors_on_course_id"
  end

  create_table "maintopics", force: :cascade do |t|
    t.string "name"
    t.bigint "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_maintopics_on_chapter_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "objectives", force: :cascade do |t|
    t.string "objective"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_objectives_on_course_id"
  end

  create_table "outcomes", force: :cascade do |t|
    t.string "outcome"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_outcomes_on_course_id"
  end

  create_table "problem_solutions", force: :cascade do |t|
    t.string "problem"
    t.string "solution"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_problem_solutions_on_course_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subtopics", force: :cascade do |t|
    t.string "name"
    t.bigint "maintopic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maintopic_id"], name: "index_subtopics_on_maintopic_id"
  end

  create_table "targets", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_targets_on_course_id"
  end

  create_table "techniques", force: :cascade do |t|
    t.string "name"
    t.bigint "outcome_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["outcome_id"], name: "index_techniques_on_outcome_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_topics_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "uses", force: :cascade do |t|
    t.integer "time"
    t.bigint "material_id"
    t.bigint "subtopic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_uses_on_material_id"
    t.index ["subtopic_id"], name: "index_uses_on_subtopic_id"
  end

  add_foreign_key "chapter_outcomes", "chapters"
  add_foreign_key "chapter_outcomes", "outcomes"
  add_foreign_key "chapters", "courses"
  add_foreign_key "courses", "categories"
  add_foreign_key "courses", "users"
  add_foreign_key "instructors", "courses"
  add_foreign_key "maintopics", "chapters"
  add_foreign_key "objectives", "courses"
  add_foreign_key "outcomes", "courses"
  add_foreign_key "problem_solutions", "courses"
  add_foreign_key "subtopics", "maintopics"
  add_foreign_key "targets", "courses"
  add_foreign_key "techniques", "outcomes"
  add_foreign_key "topics", "courses"
  add_foreign_key "users", "roles"
  add_foreign_key "uses", "materials"
  add_foreign_key "uses", "subtopics"
end
