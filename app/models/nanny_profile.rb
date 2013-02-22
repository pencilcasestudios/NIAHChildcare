class NannyProfile < ActiveRecord::Base
  mount_uploader :resume, ResumeUploader

  belongs_to :user

  has_many :addresses, as: :addresseable
  has_many :educations, as: :educatable
  has_many :employers, as: :employable
  has_many :references, as: :referenceable

  validates :statement_of_truth, acceptance: true

  attr_accessor :statement_of_truth

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
  attr_accessible :resume
  attr_accessible :resume_cache
  attr_accessible :statement_of_truth
  attr_accessible :work_accommodation_preference
  attr_accessible :work_location_preference_description

  # Nested attributes
  attr_accessible :addresses_attributes
  attr_accessible :educations_attributes
  attr_accessible :employers_attributes
  attr_accessible :references_attributes

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :employers, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :references, reject_if: :all_blank, allow_destroy: true

  ACCOMMODATION_PREFERENCES = {
    # Translation                                                   # Database key
    I18n.t("models.nanny_profile.accommodation_preferences.live_in")      =>     "live_in",
    I18n.t("models.nanny_profile.accommodation_preferences.live_out")     =>     "live_out",
  }

  COMMITMENT_PREFERENCES = {
    # Translation                                                              # Database key
    I18n.t("models.nanny_profile.commitment_preferences.full_time")     =>     "full_time",
    I18n.t("models.nanny_profile.commitment_preferences.part_time")     =>     "part_time",
  }
end
