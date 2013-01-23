class CreateNannyProfiles < ActiveRecord::Migration
  def change
    create_table :nanny_profiles do |t|
      t.boolean :can_contact_current_employer
      t.boolean :has_a_valid_drivers_license
      t.boolean :has_been_convicted_of_a_felony
      t.boolean :is_authorised_to_work_in_the_united_states
      t.boolean :is_certified_in_child_cpr
      t.boolean :is_certified_in_child_first_aid
      t.boolean :is_willing_to_become_cpr_certified
      t.boolean :is_willing_to_become_first_aid_certified
      t.datetime :available_to_start_at
      t.datetime :cpr_certification_expires_at
      t.datetime :current_address_since_at
      t.datetime :date_of_birth
      t.datetime :first_aid_certification_expires_at
      t.references :user
      t.string :commitment_preference
      t.string :contact_preference
      t.string :full_name
      t.string :work_accomodation_preference
      t.text :childcare_experience_description
      t.text :felony_conviction_description
      t.text :hobbies_description
      t.text :ideal_work_description
      t.text :languages_spoken
      t.text :previous_full_names
      t.text :work_location_preference_description

      t.timestamps
    end
    add_index :nanny_profiles, :user_id
  end
end
