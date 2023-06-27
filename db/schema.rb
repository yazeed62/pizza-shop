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

ActiveRecord::Schema.define(version: 2023_06_27_172155) do

  create_table "pizzas", force: :cascade do |t|
    t.string "name"
    t.string "ingredients"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurant_pizzas", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.integer "pizza_id", null: false
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pizza_id"], name: "index_restaurant_pizzas_on_pizza_id"
    t.index ["restaurant_id"], name: "index_restaurant_pizzas_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "restaurant_pizzas", "pizzas"
  add_foreign_key "restaurant_pizzas", "restaurants"
end
