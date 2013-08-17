class AddScoreChangeToPlayedHole < ActiveRecord::Migration
  def change
    add_column :played_holes, :score_change, :integer
  end
end
