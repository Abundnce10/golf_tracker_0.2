# == Schema Information
#
# Table name: rounds
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  course_id        :integer
#  tee_id           :integer
#  date_played      :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_handicap_id :integer
#  starting_hole    :integer
#  hour_of_day      :integer
#

class Round < ActiveRecord::Base
  attr_accessible :course_id, :date_played, :hour_of_day, :starting_hole, :tee_id, :user_id, :user_handicap_id

  has_one    :round_summary
  has_many   :hole_notes
  has_many   :played_holes
  has_many   :round_notes
  belongs_to :course
  belongs_to :tee
  belongs_to :user
  belongs_to :time_of_day
  belongs_to :user_handicap

  validates :user_id, :course_id, :tee_id, :presence => true
  #validates_date :date_played
end
