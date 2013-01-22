class Address < ActiveRecord::Base
  belongs_to :addresseable

  attr_accessible :city
  attr_accessible :email
  attr_accessible :phone
  attr_accessible :state
  attr_accessible :street_address
  attr_accessible :zip_code
end
