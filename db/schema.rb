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

ActiveRecord::Schema[7.0].define(version: 2023_09_03_163632) do
  create_table "accounts", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "type"
    t.boolean "on_budget"
    t.boolean "closed"
    t.string "note"
    t.integer "balance"
    t.integer "cleared_balance"
    t.integer "uncleared_balance"
    t.string "transfer_payee_id"
    t.boolean "direct_import_linked"
    t.time "last_reconciled_at"
    t.boolean "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "budget_id", null: false
    t.index ["budget_id"], name: "index_accounts_on_budget_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.time "last_modified_on"
    t.date "first_month"
    t.date "last_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.boolean "hidden"
    t.string "note"
    t.integer "budgeted"
    t.integer "activity"
    t.integer "balance"
    t.string "goal_type"
    t.integer "goal_day"
    t.integer "goal_cadence"
    t.integer "goal_cadence_frequency"
    t.date "goal_creation_month"
    t.integer "goal_target"
    t.date "goal_target_month"
    t.integer "goal_percentage_complete"
    t.integer "goal_months_to_budget"
    t.integer "goal_overall_funded"
    t.integer "goal_overall_left"
    t.boolean "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_group_id", null: false
    t.index ["category_group_id"], name: "index_categories_on_category_group_id"
  end

  create_table "category_groups", force: :cascade do |t|
    t.string "uid"
    t.boolean "hidden"
    t.boolean "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "budget_id", null: false
    t.index ["budget_id"], name: "index_category_groups_on_budget_id"
  end

  create_table "payees", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "transfer_account_id"
    t.boolean "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "budget_id", null: false
    t.index ["budget_id"], name: "index_payees_on_budget_id"
  end

  add_foreign_key "accounts", "budgets"
  add_foreign_key "categories", "category_groups"
  add_foreign_key "category_groups", "budgets"
  add_foreign_key "payees", "budgets"
end
