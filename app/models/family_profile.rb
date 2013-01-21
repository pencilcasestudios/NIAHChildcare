class FamilyProfile < ActiveRecord::Base
  belongs_to :user

  has_many :children
  has_many :guardians

  accepts_nested_attributes_for :children, allow_destroy: true
  accepts_nested_attributes_for :guardians, allow_destroy: true

  attr_accessible :interests_description
  attr_accessible :pets_description
end