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

ActiveRecord::Schema.define(version: 2021_11_13_010524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cursed_items", force: :cascade do |t|
    t.string "name"
    t.string "youtube_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "label_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "labelings", force: :cascade do |t|
    t.bigint "cursed_item_id"
    t.bigint "label_name_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cursed_item_id"], name: "index_labelings_on_cursed_item_id"
    t.index ["label_name_id"], name: "index_labelings_on_label_name_id"
  end

  add_foreign_key "labelings", "cursed_items"
  add_foreign_key "labelings", "label_names"
end
