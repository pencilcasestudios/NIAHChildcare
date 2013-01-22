class Reference < ActiveRecord::Base
  belongs_to :referenceable

  attr_accessible :full_name
  attr_accessible :known_since
  attr_accessible :relationship
end
