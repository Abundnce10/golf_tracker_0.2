class AddScoreToParToRoundSummary < ActiveRecord::Migration
  def change
    add_column :round_summaries, :score_to_par, :integer
  end
end
