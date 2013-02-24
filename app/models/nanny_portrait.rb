class NannyPortrait < ActiveRecord::Base
  belongs_to :family_profile

  has_many :notes, as: :noteable
  has_many :references, as: :referenceable

  accepts_nested_attributes_for :references, allow_destroy: true

  attr_accessible :accommodation_description
  attr_accessible :commitment_requirement
  attr_accessible :commitment_start_at
  attr_accessible :end_at
  attr_accessible :family_profile_id
  attr_accessible :fit_description
  attr_accessible :is_car_provided
  attr_accessible :is_car_provided_available_after_hours
  attr_accessible :job_description
  attr_accessible :qualities_description
  attr_accessible :start_at
  attr_accessible :vacation_description
  attr_accessible :work_hours_description

  # Nested attributes
  attr_accessible :references_attributes

  COMMITMENTS = {
    # Translation                                                   # Database key
    I18n.t("models.nanny_portrait.commitments.live_in")      =>     "live_in",
    I18n.t("models.nanny_portrait.commitments.live_out")     =>     "live_out",
    I18n.t("models.nanny_portrait.commitments.temporary")    =>     "temporary",
    I18n.t("models.nanny_portrait.commitments.seasonal")     =>     "seasonal",
  }
end
