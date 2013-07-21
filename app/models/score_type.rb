# == Schema Information
#
# Table name: score_types
#
#  id                    :integer          not null, primary key
#  score_type            :string(255)
#  score_relative_to_par :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class ScoreType < ActiveRecord::Base
  attr_accessible :score_relative_to_par, :score_type
end
