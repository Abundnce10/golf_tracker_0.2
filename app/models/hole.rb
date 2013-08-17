# == Schema Information
#
# Table name: holes
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  tee_id     :integer
#  number     :integer
#  distance   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  par        :integer
#

class Hole < ActiveRecord::Base
  attr_accessible :course_id, :distance, :number, :par, :tee_id

  belongs_to :course, dependent: :destroy
  belongs_to :tee
  has_many   :hole_notes
  has_many   :played_holes

  validates :course_id, :tee_id, :number, :presence => true
  validates :number, :numericality => { :only_integer => true,
                                        :greater_than => 0,
                                        :less_than    => 37 }
  validates :distance, :numericality => { :only_integer => true,
                                         :greater_than => 0,
                                         :less_than    => 1000 }
end
