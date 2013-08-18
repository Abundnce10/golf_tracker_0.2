# == Schema Information
#
# Table name: played_holes
#
#  id           :integer          not null, primary key
#  round_id     :integer
#  hole_id      :integer
#  fairway_id   :integer
#  GIR          :integer
#  putts        :integer
#  bunker       :integer
#  OB           :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  strokes      :integer
#  scramble     :integer
#  score_change :integer
#

class PlayedHole < ActiveRecord::Base
  attr_accessible :GIR, :OB, :bunker, :fairway_id, :hole_id, :putts, :round_id, :score_change, :scramble, :strokes

  belongs_to :fairway
  belongs_to :hole
  belongs_to :round
  has_many   :putt_details
  has_many   :approach_details
  has_many   :drive_details

  validates :round_id, :hole_id, :putts, :strokes, :presence => true
  validates :putts, :numericality => { :only_integer => true,
                                         :greater_than_or_equal_to => 0,
                                         :less_than    => 10 }
  validates :strokes, :numericality => { :only_integer => true,
                                         :greater_than_or_equal_to => 1,
                                         :less_than    => 20 }
  validates :GIR, :numericality => { :only_integer => true,
                                         :greater_than_or_equal_to => 0,
                                         :less_than_or_equal_to    => 1 },
                  :allow_nil => true                                       
  validates :bunker, :numericality => { :only_integer => true },
                      :allow_nil => true
  validates :OB, :numericality => { :only_integer => true,
                                         :greater_than_or_equal_to => 0,
                                         :less_than_or_equal_to    => 1 },
                 :allow_nil => true

end
