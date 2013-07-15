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

  validates :course_id, :tee_id, :gender_id, :number, :par, :presence => true
  validates :number, :numericality => { :only_integer => true,
                                        :greater_than => 0,
                                        :less_than    => 36 }
  validates :distance, :numericality => { :only_integer => true,
                                         :greater_than => 0,
                                         :less_than    => 1000 }
  validates :par, :numericality => { :only_integer => true,
                                     :greater_than => 2,
                                     :less_than    => 6}

end
