# == Schema Information
#
# Table name: course_types
#
#  id          :integer          not null, primary key
#  course_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CourseType < ActiveRecord::Base
  attr_accessible :course_type
end
