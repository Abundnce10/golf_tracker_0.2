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
#

class PlayedHole < ActiveRecord::Base
  attr_accessible :GIR, :OB, :bunker, :fairway_id, :hole_id, :putts, :round_id
end
