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

class ScoreSummary < ActiveRecord::Base
  attr_accessible :birdies, :bogies, :double_bogies, :double_eagles, :eagles, :hole_in_ones, :pars, :quad_plus_bogies, :triple_bogies
end
