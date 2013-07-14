# == Schema Information
#
# Table name: completed_holes
#
#  id              :integer          not null, primary key
#  round_id        :integer
#  holes_completed :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class CompletedHole < ActiveRecord::Base
  attr_accessible :holes_completed, :round_id
end
