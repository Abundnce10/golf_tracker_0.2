class CreateScoreSummaries < ActiveRecord::Migration
  def change
    create_table :score_summaries do |t|
      t.integer :hole_in_ones
      t.integer :double_eagles
      t.integer :eagles
      t.integer :birdies
      t.integer :pars
      t.integer :bogies
      t.integer :double_bogies
      t.integer :triple_bogies
      t.integer :quad_plus_bogies

      t.timestamps
    end
  end
end
