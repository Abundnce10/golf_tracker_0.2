# == Schema Information
#
# Table name: rounds
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  course_id   :integer
#  tee_id      :integer
#  date_played :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Round do
  pending "add some examples to (or delete) #{__FILE__}"
end
