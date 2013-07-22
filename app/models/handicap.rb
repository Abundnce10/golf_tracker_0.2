# == Schema Information
#
# Table name: handicaps
#
#  id          :integer          not null, primary key
#  hole_number :integer
#  gender_id   :integer
#  handicap    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#

class Handicap < ActiveRecord::Base
  attr_accessible :course_id, :gender_id, :handicap, :hole_number

  belongs_to :gender
  belongs_to :course
end
