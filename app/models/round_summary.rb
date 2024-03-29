# == Schema Information
#
# Table name: round_summaries
#
#  id                   :integer          not null, primary key
#  round_id             :integer
#  score_summary_id     :integer
#  total_strokes        :integer
#  front_9_strokes      :integer
#  back_9_strokes       :integer
#  fairways_hit         :integer
#  fairways_possible    :integer
#  GIRs_hit             :integer
#  GIRs_possible        :integer
#  total_putts          :integer
#  front_9_putts        :integer
#  back_9_putts         :integer
#  sand_shots           :integer
#  OBs                  :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  scrambles_possible   :integer
#  scrambles_successful :integer
#  score_to_par         :integer
#

class RoundSummary < ActiveRecord::Base
  attr_accessible :GIRs_hit, :GIRs_possible, :OBs, :back_9_putts, :back_9_strokes, :fairways_hit, :fairways_possible, :front_9_putts, :front_9_strokes, :round_id, :sand_shots, :score_summary_id, :score_to_par, :scrambles_possible, :scrambles_successful, :total_putts, :total_strokes

  belongs_to :score_summary
  belongs_to :round

  
end
