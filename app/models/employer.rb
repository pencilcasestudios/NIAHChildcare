class Employer < ActiveRecord::Base
  belongs_to :employable

  has_many :addresses, as: :addresseable

  attr_accessible :ended_at
  attr_accessible :name
  attr_accessible :reason_for_leaving
  attr_accessible :started_at
  attr_accessible :supervisor_name

  # Nested attributes
  attr_accessible :addresses_attributes

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
end
