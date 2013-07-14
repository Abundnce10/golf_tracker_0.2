# == Schema Information
#
# Table name: holes
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  tee_id     :integer
#  gender_id  :integer
#  number     :integer
#  distance   :integer
#  par        :integer
#  handicap   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hole < ActiveRecord::Base
  attr_accessible :course_id, :distance, :gender_id, :handicap, :number, :par, :tee_id
end
