class AddScramblesPossibleToRoundSummary < ActiveRecord::Migration
  def change
    add_column :round_summaries, :scrambles_possible, :integer
    add_column :round_summaries, :scrambles_successful, :integer
    remove_column :round_summaries, :scrambling_percentage, :float
  end
end
