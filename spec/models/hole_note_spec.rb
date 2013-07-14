# == Schema Information
#
# Table name: hole_notes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  round_id   :integer
#  hole_id    :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe HoleNote do
  pending "add some examples to (or delete) #{__FILE__}"
end
