# == Schema Information
#
# Table name: approach_details
#
#  id                 :integer          not null, primary key
#  played_hole_id     :integer
#  score_type_id      :integer
#  distance_from_hole :integer
#  on_green           :boolean
#  in_the_hole        :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  OB                 :boolean
#  sand               :boolean
#

class ApproachDetail < ActiveRecord::Base
  attr_accessible :distance_from_hole, :in_the_hole, :on_green, :played_hole_id, :score_type_id

  belongs_to :score_type
  belongs_to :played_hole
end
