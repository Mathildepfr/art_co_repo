# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_06_045437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_invitations", force: :cascade do |t|
    t.integer "status", default: 0
    t.bigint "expo_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expo_id"], name: "index_artist_invitations_on_expo_id"
    t.index ["user_id"], name: "index_artist_invitations_on_user_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "price"
    t.string "size"
    t.boolean "available"
    t.string "type"
    t.string "style"
    t.bigint "collection_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collection_id"], name: "index_artworks_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.bigint "expo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expo_id"], name: "index_collections_on_expo_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "expos", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "description"
    t.bigint "venue_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["venue_id"], name: "index_expos_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.boolean "is_artist"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "type_of_venue"
    t.string "venue_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_venues_on_user_id"
  end

  add_foreign_key "artist_invitations", "expos"
  add_foreign_key "artist_invitations", "users"
  add_foreign_key "artworks", "collections"
  add_foreign_key "collections", "expos"
  add_foreign_key "collections", "users"
  add_foreign_key "expos", "venues"
  add_foreign_key "venues", "users"
end
