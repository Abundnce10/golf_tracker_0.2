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

require 'spec_helper'

describe PuttDetail do
  pending "add some examples to (or delete) #{__FILE__}"
end
