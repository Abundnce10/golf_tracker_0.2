# == Schema Information
#
# Table name: rounds
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  course_id   :integer
#  tee_id      :integer
#  date_played :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Round < ActiveRecord::Base
  attr_accessible :course_id, :date_played, :tee_id, :user_id

  has_one    :round_summary
  has_many   :hole_notes
  has_many   :played_holes
  has_many   :round_notes
  belongs_to :course
  belongs_to :tee
  belongs_to :user, dependent: :destroy

  validates :user_id, :course_id, :tee_id, :presence => true
  validates_date :date_played
end
