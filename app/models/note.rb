class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :noteable

  attr_accessible :body
end
