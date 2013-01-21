class Child < ActiveRecord::Base
  belongs_to :family_profile

  attr_accessible :born_at
  attr_accessible :full_name
  attr_accessible :interests_description
  attr_accessible :special_needs_description
end
