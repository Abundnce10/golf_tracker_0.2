# == Schema Information
#
# Table name: genders
#
#  id          :integer          not null, primary key
#  gender_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Gender < ActiveRecord::Base
  attr_accessible :gender_type

  has_many :holes
  has_many :slope_ratings

end
