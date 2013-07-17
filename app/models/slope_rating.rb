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

  belongs_to :course, dependent: :destroy
  belongs_to :gender
  belongs_to :tee

  validates :tee_id, :gender_id, :course_id, :presence => true
  validates :slope, :numericality => { :only_integer => true }
  validates :rating, :format => { :with => /^\d+??(?:\.\d{0,1})?$/ }

end
