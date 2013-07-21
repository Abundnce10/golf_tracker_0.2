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
#

class DriveDetail < ActiveRecord::Base
  attr_accessible :distance_of_drive, :on_fairway, :played_hole_id
end
