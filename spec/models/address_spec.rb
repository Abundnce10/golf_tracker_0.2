# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  state_id   :integer
#  street     :string(255)
#  latitude   :string(255)
#  longitude  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#  zipcode_id :integer
#

require 'spec_helper'

describe Address do
  pending "add some examples to (or delete) #{__FILE__}"
end
