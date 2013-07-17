# == Schema Information
#
# Table name: fairways
#
#  id               :integer          not null, primary key
#  fairway_accuracy :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Fairway < ActiveRecord::Base
  attr_accessible :fairway_accuracy

  has_many :played_holes
end
