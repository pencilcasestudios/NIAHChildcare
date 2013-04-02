class Reference < ActiveRecord::Base
  belongs_to :referenceable
  has_many :addresses, as: :addresseable

  attr_accessible :full_name
  attr_accessible :known_since
  attr_accessible :relationship

  validates :full_name, presence: true
  validates :known_since, presence: true
  validates :relationship, presence: true
end
