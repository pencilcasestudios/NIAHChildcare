class FamilyProfile < ActiveRecord::Base
  belongs_to :user

  has_many :addresses, as: :addresseable
  has_many :children
  has_many :guardians
  has_many :nanny_portraits
  has_many :notes, as: :noteable
  has_many :references, as: :referenceable

  validates :statement_of_truth, acceptance: true

  attr_accessor :statement_of_truth

  attr_accessible :interests_description
  attr_accessible :pets_description
  attr_accessible :statement_of_truth


  # Nested attributes
  attr_accessible :addresses_attributes
  attr_accessible :children_attributes
  attr_accessible :guardians_attributes
  attr_accessible :references_attributes

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :children, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :guardians, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :references, reject_if: :all_blank, allow_destroy: true
end
