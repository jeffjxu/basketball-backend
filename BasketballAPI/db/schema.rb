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

ActiveRecord::Schema.define(version: 2020_10_20_035901) do

  create_table "favorites", force: :cascade do |t|
    t.integer "favoriter_id"
    t.integer "favoritee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favoritee_id"], name: "index_favorites_on_favoritee_id"
    t.index ["favoriter_id"], name: "index_favorites_on_favoriter_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "time"
    t.text "description"
    t.boolean "private"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "status"
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.date "dob"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
