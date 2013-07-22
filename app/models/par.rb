# == Schema Information
#
# Table name: pars
#
#  id          :integer          not null, primary key
#  hole_number :integer
#  gender_id   :integer
#  par         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#

class Par < ActiveRecord::Base
  attr_accessible :course_id, :gender_id, :hole_number, :par

  belongs_to :gender
  belongs_to :course
end
