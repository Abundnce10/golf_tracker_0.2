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

  belongs_to :round, counter_cache: true, dependent: :destroy

  validates :round_id, :presence => true
  validates :holes_completed, :presence => true,
                              :numericality => { :only_integer => true,
                                                 :less_than => 109 }
end
