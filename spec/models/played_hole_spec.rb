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

require 'spec_helper'

describe PlayedHole do
  pending "add some examples to (or delete) #{__FILE__}"
end
