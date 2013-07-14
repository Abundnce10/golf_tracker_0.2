# == Schema Information
#
# Table name: slope_ratings
#
#  id         :integer          not null, primary key
#  tee_id     :integer
#  gender_id  :integer
#  course_id  :integer
#  slope      :integer
#  rating     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SlopeRating < ActiveRecord::Base
  attr_accessible :course_id, :gender_id, :rating, :slope, :tee_id
end
