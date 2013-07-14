# == Schema Information
#
# Table name: fees
#
#  id         :integer          not null, primary key
#  weekday_18 :float
#  weekday_9  :float
#  weekend_18 :float
#  weekend_9  :float
#  twilight   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Fee do
  pending "add some examples to (or delete) #{__FILE__}"
end
