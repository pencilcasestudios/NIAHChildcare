class FamilyProfile < ActiveRecord::Base
  belongs_to :user

  has_many :addresses, as: :addresseable
  has_many :children
  has_many :guardians
  has_many :nanny_portraits
  has_many :references, as: :referenceable

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :children, allow_destroy: true
  accepts_nested_attributes_for :guardians, allow_destroy: true
  accepts_nested_attributes_for :references, allow_destroy: true

  attr_accessible :interests_description
  attr_accessible :pets_description

  # Nested attributes
  attr_accessible :addresses_attributes
  attr_accessible :children_attributes
  attr_accessible :guardians_attributes
  attr_accessible :references_attributes
end
