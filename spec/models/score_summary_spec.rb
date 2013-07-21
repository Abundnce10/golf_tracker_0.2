# == Schema Information
#
# Table name: score_summaries
#
#  id               :integer          not null, primary key
#  hole_in_ones     :integer
#  double_eagles    :integer
#  eagles           :integer
#  birdies          :integer
#  pars             :integer
#  bogies           :integer
#  double_bogies    :integer
#  triple_bogies    :integer
#  quad_plus_bogies :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe ScoreSummary do
  pending "add some examples to (or delete) #{__FILE__}"
end
