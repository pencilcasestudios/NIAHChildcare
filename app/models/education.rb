class Education < ActiveRecord::Base
  belongs_to :educatable

  has_many :addresses, as: :addresseable

  attr_accessible :ended_at
  attr_accessible :name
  attr_accessible :qualification
  attr_accessible :started_at

  # Nested attributes
  attr_accessible :addresses_attributes

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
end
