# == Schema Information
#
# Table name: rounds
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  course_id        :integer
#  tee_id           :integer
#  date_played      :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_handicap_id :integer
#  starting_hole    :integer
#  hour_of_day      :integer
#

require 'spec_helper'

describe Round do
  pending "add some examples to (or delete) #{__FILE__}"
end
