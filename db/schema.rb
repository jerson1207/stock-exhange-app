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

ActiveRecord::Schema.define(version: 2021_12_10_184623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_transaction_stock_buys", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_buy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_buy_id"], name: "index_admin_transaction_stock_buys_on_stock_buy_id"
    t.index ["user_id"], name: "index_admin_transaction_stock_buys_on_user_id"
  end

  create_table "admin_transaction_stock_sells", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_sell_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_sell_id"], name: "index_admin_transaction_stock_sells_on_stock_sell_id"
    t.index ["user_id"], name: "index_admin_transaction_stock_sells_on_user_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.decimal "cash"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stock_buys", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.decimal "last_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stock_sells", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.decimal "last_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.decimal "last_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transaction_deposits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "deposit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deposit_id"], name: "index_transaction_deposits_on_deposit_id"
    t.index ["user_id"], name: "index_transaction_deposits_on_user_id"
  end

  create_table "transaction_stock_buys", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_buy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_buy_id"], name: "index_transaction_stock_buys_on_stock_buy_id"
    t.index ["user_id"], name: "index_transaction_stock_buys_on_user_id"
  end

  create_table "transaction_stock_sells", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_sell_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_sell_id"], name: "index_transaction_stock_sells_on_stock_sell_id"
    t.index ["user_id"], name: "index_transaction_stock_sells_on_user_id"
  end

  create_table "transaction_withdraws", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "withdraw_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_transaction_withdraws_on_user_id"
    t.index ["withdraw_id"], name: "index_transaction_withdraws_on_withdraw_id"
  end

  create_table "user_stocks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_user_stocks_on_stock_id"
    t.index ["user_id"], name: "index_user_stocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "cash", default: "0.0"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "withdraws", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "admin_transaction_stock_buys", "stock_buys"
  add_foreign_key "admin_transaction_stock_buys", "users"
  add_foreign_key "admin_transaction_stock_sells", "stock_sells"
  add_foreign_key "admin_transaction_stock_sells", "users"
  add_foreign_key "transaction_deposits", "deposits"
  add_foreign_key "transaction_deposits", "users"
  add_foreign_key "transaction_stock_buys", "stock_buys"
  add_foreign_key "transaction_stock_buys", "users"
  add_foreign_key "transaction_stock_sells", "stock_sells"
  add_foreign_key "transaction_stock_sells", "users"
  add_foreign_key "transaction_withdraws", "users"
  add_foreign_key "transaction_withdraws", "withdraws"
  add_foreign_key "user_stocks", "stocks"
  add_foreign_key "user_stocks", "users"
end
