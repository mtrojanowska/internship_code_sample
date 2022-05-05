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

ActiveRecord::Schema.define(version: 2022_05_02_133454) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "categories_stories", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "story_id", null: false
    t.index ["category_id", "story_id"], name: "index_categories_stories_on_category_id_and_story_id"
    t.index ["story_id", "category_id"], name: "index_categories_stories_on_story_id_and_category_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "story_id"
    t.integer "writer_id"
    t.index ["story_id"], name: "index_comments_on_story_id"
    t.index ["writer_id"], name: "index_comments_on_writer_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type"
    t.integer "likeable_id"
    t.integer "writer_id"
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["writer_id", "likeable_id", "likeable_type"], name: "index_likes_on_writer_id_and_likeable_id_and_likeable_type", unique: true
    t.index ["writer_id"], name: "index_likes_on_writer_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "writer_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["writer_id"], name: "index_stories_on_writer_id"
  end

  create_table "writers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.integer "role", default: 0
    t.index ["email"], name: "index_writers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_writers_on_reset_password_token", unique: true
  end

end
