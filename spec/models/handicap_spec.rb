# == Schema Information
#
# Table name: handicaps
#
#  id         :integer          not null, primary key
#  hole_id    :integer
#  gender_id  :integer
#  handicap   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Handicap do
  pending "add some examples to (or delete) #{__FILE__}"
end
