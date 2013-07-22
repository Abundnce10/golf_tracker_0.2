# == Schema Information
#
# Table name: holes
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  tee_id     :integer
#  number     :integer
#  distance   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Hole do
  pending "add some examples to (or delete) #{__FILE__}"
end
