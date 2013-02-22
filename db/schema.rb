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

ActiveRecord::Schema.define(:version => 20130209080534) do

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
    t.datetime "born_at"
    t.integer  "family_profile_id"
    t.string   "full_name"
    t.text     "gender"
    t.text     "interests_description"
    t.text     "special_needs_description"
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

  create_table "educations", :force => true do |t|
    t.boolean  "is_a_graduate"
    t.datetime "ended_at"
    t.datetime "started_at"
    t.integer  "educatable_id"
    t.string   "educatable_type"
    t.string   "name"
    t.string   "qualification"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "educations", ["educatable_id"], :name => "index_educations_on_educatable_id"

  create_table "employers", :force => true do |t|
    t.datetime "ended_at"
    t.datetime "started_at"
    t.integer  "employable_id"
    t.string   "employable_type"
    t.string   "name"
    t.string   "supervisor_name"
    t.text     "reason_for_leaving"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "employers", ["employable_id"], :name => "index_employers_on_employable_id"

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
    t.boolean  "is_car_provided"
    t.boolean  "is_car_provided_available_after_hours"
    t.datetime "commitment_start_at"
    t.datetime "end_at"
    t.datetime "start_at"
    t.integer  "family_profile_id"
    t.string   "commitment_requirement"
    t.text     "accommodation_description"
    t.text     "fit_description"
    t.text     "job_description"
    t.text     "qualities_description"
    t.text     "vacation_description"
    t.text     "work_hours_description"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "nanny_portraits", ["family_profile_id"], :name => "index_nanny_portraits_on_family_profile_id"

  create_table "nanny_profiles", :force => true do |t|
    t.boolean  "can_contact_current_employer"
    t.boolean  "has_a_valid_drivers_license"
    t.boolean  "has_been_convicted_of_a_felony"
    t.boolean  "is_authorised_to_work_in_the_united_states"
    t.boolean  "is_certified_in_child_cpr"
    t.boolean  "is_certified_in_child_first_aid"
    t.boolean  "is_willing_to_become_cpr_certified"
    t.boolean  "is_willing_to_become_first_aid_certified"
    t.datetime "available_to_start_at"
    t.datetime "cpr_certification_expires_at"
    t.datetime "current_address_since_at"
    t.datetime "date_of_birth"
    t.datetime "first_aid_certification_expires_at"
    t.integer  "user_id"
    t.string   "commitment_preference"
    t.string   "contact_preference"
    t.string   "full_name"
    t.string   "resume"
    t.string   "work_accommodation_preference"
    t.text     "childcare_experience_description"
    t.text     "felony_conviction_description"
    t.text     "hobbies_description"
    t.text     "ideal_work_description"
    t.text     "languages_spoken"
    t.text     "previous_full_names"
    t.text     "work_location_preference_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "nanny_profiles", ["user_id"], :name => "index_nanny_profiles_on_user_id"

  create_table "references", :force => true do |t|
    t.datetime "known_since"
    t.integer  "referenceable_id"
    t.string   "referenceable_type"
    t.string   "full_name"
    t.string   "relationship"
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
