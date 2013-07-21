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

require 'spec_helper'

describe DriveDetail do
  pending "add some examples to (or delete) #{__FILE__}"
end
