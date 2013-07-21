class CreateRoundSummaries < ActiveRecord::Migration
  def change
    create_table :round_summaries do |t|
      t.integer :round_id
      t.integer :score_summary_id
      t.integer :total_strokes
      t.integer :front_9_strokes
      t.integer :back_9_strokes
      t.integer :fairways_hit
      t.integer :fairways_possible
      t.integer :GIRs_hit
      t.integer :GIRs_possible
      t.integer :total_putts
      t.integer :front_9_putts
      t.integer :back_9_putts
      t.decimal :scrambling_percentage
      t.integer :sand_shots
      t.integer :OBs

      t.timestamps
    end
  end
end
