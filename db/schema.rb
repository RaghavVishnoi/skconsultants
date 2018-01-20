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

ActiveRecord::Schema.define(version: 20180120102232) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "first_name",     null: false
    t.string   "last_name"
    t.string   "contact_number", null: false
    t.string   "email",          null: false
    t.string   "state",          null: false
    t.string   "city",           null: false
    t.text     "street",         null: false
    t.string   "qualification",  null: false
    t.string   "document",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "experience",     null: false
    t.string   "job_title",      null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact_number"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end


  create_table "current_openings", force: :cascade do |t|
    t.string   "name"
    t.string   "exp_required"
    t.string   "from"
    t.string   "to"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count_openings"
    t.string   "employer_industry"
    t.text     "job_description"
    t.string   "functional_area"
    t.string   "annual_salary_offered"
    t.text     "job_location"
    t.string   "candidate_industry"
    t.text     "current_location"
    t.string   "current_annual_salary"
    t.string   "minimum_exp"
    t.string   "maximum_exp"
    t.string   "qualification1"
    t.string   "highest_qualification"
    t.string   "company_name"
    t.string   "company_display_name"
    t.text     "company_description"
    t.text     "candidate_skills"
  end

  create_table "documents", force: :cascade do |t|
    t.string   "document",      null: false
    t.string   "resource_type", null: false
    t.string   "resource_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "name"
    t.string   "status"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

>>>>>>> Stashed changes
end
