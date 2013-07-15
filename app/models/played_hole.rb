# == Schema Information
#
# Table name: played_holes
#
#  id         :integer          not null, primary key
#  round_id   :integer
#  hole_id    :integer
#  fairway_id :integer
#  GIR        :integer
#  putts      :integer
#  bunker     :integer
#  OB         :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  strokes    :integer
#

class PlayedHole < ActiveRecord::Base
  attr_accessible :GIR, :OB, :bunker, :fairway_id, :hole_id, :putts, :round_id

  validates :round_id, :hole_id, :fairway_id, :putts, :strokes, :presence => true
  validates :putts, :numericality => { :only_integer => true,
                                         :greater_than_or_equal_to => 0,
                                         :less_than    => 10 }
  validates :strokes, :numericality => { :only_integer => true,
                                         :greater_than_or_equal_to => 1,
                                         :less_than    => 20 }
  validates :GIR, :numericality => { :only_integer => true,
                                         :greater_than_or_equal_to => 0,
                                         :less_than_or_equal_to    => 1 }                                         
  validates :bunker, :numericality => { :only_integer => true,
                                         :greater_than_or_equal_to => 0,
                                         :less_than_or_equal_to    => 1 }
  validates :OB, :numericality => { :only_integer => true,
                                         :greater_than_or_equal_to => 0,
                                         :less_than_or_equal_to    => 1 }

end
