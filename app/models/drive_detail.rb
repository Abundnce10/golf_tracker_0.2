# == Schema Information
#
# Table name: drive_details
#
#  id                :integer          not null, primary key
#  played_hole_id    :integer
#  distance_of_drive :integer
#  on_fairway        :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  OB                :boolean
#  sand              :boolean
#

class DriveDetail < ActiveRecord::Base
  attr_accessible :distance_of_drive, :on_fairway, :played_hole_id

  belongs_to :score_type
  belongs_to :played_hole
end
