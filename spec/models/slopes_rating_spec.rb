# == Schema Information
#
# Table name: slopes_ratings
#
#  id         :integer          not null, primary key
#  tee_id     :integer
#  gender_id  :integer
#  course_id  :integer
#  slope      :integer
#  rating     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe SlopesRating do
  pending "add some examples to (or delete) #{__FILE__}"
end
