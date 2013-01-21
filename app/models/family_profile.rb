class FamilyProfile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :interests_description
  attr_accessible :pets_description
end
