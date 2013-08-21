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

require 'spec_helper'

describe RoundSummary do
  pending "add some examples to (or delete) #{__FILE__}"
end
