class Child < ActiveRecord::Base
  belongs_to :family_profile

  attr_accessible :born_at
  attr_accessible :full_name
  attr_accessible :gender
  attr_accessible :interests_description
  attr_accessible :special_needs_description

  GENDERS = {
    # Translation                                 # Database key
    I18n.t("models.child.genders.male")     =>    "male",
    I18n.t("models.child.genders.female")    =>    "female",
  }
end
