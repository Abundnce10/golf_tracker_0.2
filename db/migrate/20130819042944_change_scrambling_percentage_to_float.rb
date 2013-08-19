class ChangeScramblingPercentageToFloat < ActiveRecord::Migration
  def up
  	change_column :round_summaries, :scrambling_percentage, :float
  end

  def down
  	change_column :round_summaries, :scrambling_percentage, :decimal
  end
end
