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

ActiveRecord::Schema.define(version: 20180312141823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examples", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id"
  end

  create_table "favorite_songs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "story", null: false
    t.integer "story_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "song_id", null: false
    t.index ["song_id"], name: "index_favorite_songs_on_song_id"
    t.index ["user_id"], name: "index_favorite_songs_on_user_id"
  end

  create_table "phases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.integer "start_date", null: false
    t.integer "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "name"], name: "index_phases_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_phases_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", null: false
    t.string "artist", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "artist"], name: "index_songs_on_name_and_artist", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "examples", "users"
  add_foreign_key "favorite_songs", "songs"
  add_foreign_key "favorite_songs", "users"
  add_foreign_key "phases", "users"
end
