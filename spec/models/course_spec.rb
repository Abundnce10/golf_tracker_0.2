# == Schema Information
#
# Table name: courses
#
#  id              :integer          not null, primary key
#  address_id      :integer
#  course_type_id  :integer
#  fee_id          :integer
#  season_id       :integer
#  website         :string(255)
#  phone_number    :string(255)
#  number_of_holes :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string(255)
#

require 'spec_helper'

describe Course do
  pending "add some examples to (or delete) #{__FILE__}"
end
