# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130122072626) do

  create_table "addresses", :force => true do |t|
    t.integer  "addresseable_id"
    t.string   "addresseable_type"
    t.string   "city"
    t.string   "email"
    t.string   "phone"
    t.string   "state"
    t.string   "zip_code"
    t.text     "street_address"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "addresses", ["addresseable_id"], :name => "index_addresses_on_addresseable_id"

  create_table "children", :force => true do |t|
    t.string   "full_name"
    t.datetime "born_at"
    t.text     "interests_description"
    t.text     "special_needs_description"
    t.integer  "family_profile_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "children", ["family_profile_id"], :name => "index_children_on_family_profile_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "family_profiles", :force => true do |t|
    t.text     "pets_description"
    t.text     "interests_description"
    t.integer  "user_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "family_profiles", ["user_id"], :name => "index_family_profiles_on_user_id"

  create_table "guardians", :force => true do |t|
    t.string   "role"
    t.string   "full_name"
    t.string   "occupation"
    t.integer  "family_profile_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "guardians", ["family_profile_id"], :name => "index_guardians_on_family_profile_id"

  create_table "nanny_portraits", :force => true do |t|
    t.integer  "family_profile_id"
    t.string   "commitment_requirement"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "accomodation_description"
    t.boolean  "is_car_provided"
    t.boolean  "is_car_provided_available_after_hours"
    t.datetime "commitment_start_at"
    t.text     "work_hours_description"
    t.text     "job_description"
    t.text     "qualities_description"
    t.text     "fit_description"
    t.text     "vacation_description"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "nanny_portraits", ["family_profile_id"], :name => "index_nanny_portraits_on_family_profile_id"

  create_table "references", :force => true do |t|
    t.string   "full_name"
    t.datetime "known_since"
    t.string   "relationship"
    t.integer  "referenceable_id"
    t.string   "referenceable_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "references", ["referenceable_id"], :name => "index_references_on_referenceable_id"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "users", :force => true do |t|
    t.string   "cell_phone_number"
    t.string   "email"
    t.string   "first_name"
    t.string   "language"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "password_digest"
    t.string   "role"
    t.string   "state"
    t.string   "time_zone"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
