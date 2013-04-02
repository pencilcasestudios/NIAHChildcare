class Reference < ActiveRecord::Base
  belongs_to :referenceable

  has_many :addresses, as: :addresseable

  attr_accessible :full_name
  attr_accessible :known_since
  attr_accessible :relationship

  # Nested attributes
  attr_accessible :addresses_attributes

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

  validates :full_name, presence: true
  validates :known_since, presence: true
  validates :relationship, presence: true
end
