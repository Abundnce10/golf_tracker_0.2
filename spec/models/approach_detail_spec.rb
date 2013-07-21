# == Schema Information
#
# Table name: approach_details
#
#  id                 :integer          not null, primary key
#  played_hole_id     :integer
#  shot_number        :integer
#  distance_from_hole :integer
#  on_green           :boolean
#  in_the_hole        :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  OB                 :boolean
#  sand               :boolean
#

require 'spec_helper'

describe ApproachDetail do
  pending "add some examples to (or delete) #{__FILE__}"
end
