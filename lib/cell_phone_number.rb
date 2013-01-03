class CellPhoneNumber < ActiveRecord::Base
  def self.random
    [["+1","1","001",""][rand 4],"#{(rand 10000000000)}"].join.strip
  end
end
