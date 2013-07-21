# == Schema Information
#
# Table name: putt_details
#
#  id                 :integer          not null, primary key
#  played_hole_id     :string(255)
#  score_type_id      :integer
#  distance_from_hole :integer
#  make               :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class PuttDetail < ActiveRecord::Base
  attr_accessible :distance_from_hole, :make, :played_hole_id, :score_type_id

  belongs_to :score_type
  belongs_to :played_hole
end
