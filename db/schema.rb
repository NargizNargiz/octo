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

ActiveRecord::Schema.define(version: 2020_01_28_142503) do

  create_table "all_scripts_descriptions", force: :cascade do |t|
    t.string "name_script"
    t.text "steps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exec_scripts", force: :cascade do |t|
    t.string "script_name"
    t.integer "success"
    t.integer "limit_errors"
    t.integer "rollbacks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "script_steps", force: :cascade do |t|
    t.integer "all_scripts_description_id"
    t.integer "exec_script_id"
    t.string "script_name"
    t.string "name_step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["all_scripts_description_id"], name: "index_script_steps_on_all_scripts_description_id"
    t.index ["exec_script_id"], name: "index_script_steps_on_exec_script_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "name_step"
    t.string "name_script"
    t.string "status"
    t.integer "rollbacks"
    t.integer "script_step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["script_step_id"], name: "index_steps_on_script_step_id"
  end

end
