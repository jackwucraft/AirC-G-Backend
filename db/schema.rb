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

ActiveRecord::Schema[7.0].define(version: 2022_12_13_065714) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.date "time_from"
    t.date "time_to"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["product_id"], name: "index_bookings_on_product_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.date "time_from"
    t.date "time_to"
    t.string "game_wanted"
    t.bigint "game_provided_id"
    t.bigint "game_received_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_provided_id"], name: "index_exchanges_on_game_provided_id"
    t.index ["game_received_id"], name: "index_exchanges_on_game_received_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_likes_on_product_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "message_boards", force: :cascade do |t|
    t.bigint "viewer_id"
    t.time "latest_view"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_message_boards_on_product_id"
    t.index ["viewer_id"], name: "index_message_boards_on_viewer_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.bigint "sender_id"
    t.bigint "message_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_board_id"], name: "index_messages_on_message_board_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price_per_day"
    t.string "platform"
    t.string "picture_url"
    t.string "sort"
    t.string "deal"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.string "avatar_url", default: "https://airgandc.oss-cn-shanghai.aliyuncs.com/WechatIMG170%E7%9A%84%E5%89%AF%E6%9C%AC.png"
    t.string "nickname", default: "user"
    t.string "addressrails"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "products"
  add_foreign_key "bookings", "users"
  add_foreign_key "exchanges", "products", column: "game_provided_id"
  add_foreign_key "exchanges", "products", column: "game_received_id"
  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "message_boards", "products"
  add_foreign_key "message_boards", "users", column: "viewer_id"
  add_foreign_key "messages", "message_boards"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "products", "users"
end
