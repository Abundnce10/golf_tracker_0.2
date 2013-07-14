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
end
