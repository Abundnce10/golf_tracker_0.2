# == Schema Information
#
# Table name: course_reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  rating     :integer
#  review     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CourseReview < ActiveRecord::Base
  attr_accessible :course_id, :rating, :review, :user_id

  validates :course_id, :rating, :user_id, :presence => true
  validates :rating, :numericality => { :only_integer => true,
                                        :less_than => 6,
                                        :greater_than_or_equal_to => 0 }
                                        
end
