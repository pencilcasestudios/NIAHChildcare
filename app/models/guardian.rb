class Guardian < ActiveRecord::Base
  belongs_to :family_profile
  attr_accessible :full_name, :occupation, :role
end
