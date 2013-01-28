class NannyProfile < ActiveRecord::Base
  belongs_to :user

  has_many :addresses, as: :addresseable
  has_many :references, as: :referenceable

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :references, reject_if: :all_blank, allow_destroy: true

  attr_accessible :available_to_start_at
  attr_accessible :can_contact_current_employer
  attr_accessible :childcare_experience_description
  attr_accessible :commitment_preference
  attr_accessible :contact_preference
  attr_accessible :cpr_certification_expires_at
  attr_accessible :current_address_since_at
  attr_accessible :date_of_birth
  attr_accessible :felony_conviction_description
  attr_accessible :first_aid_certification_expires_at
  attr_accessible :full_name
  attr_accessible :has_a_valid_drivers_license
  attr_accessible :has_been_convicted_of_a_felony
  attr_accessible :hobbies_description
  attr_accessible :ideal_work_description
  attr_accessible :is_authorised_to_work_in_the_united_states
  attr_accessible :is_certified_in_child_cpr
  attr_accessible :is_certified_in_child_first_aid
  attr_accessible :is_willing_to_become_cpr_certified
  attr_accessible :is_willing_to_become_first_aid_certified
  attr_accessible :languages_spoken
  attr_accessible :previous_full_names
  attr_accessible :work_accomodation_preference
  attr_accessible :work_location_preference_description

  # Nested attributes
  attr_accessible :addresses_attributes
  attr_accessible :references_attributes
end
