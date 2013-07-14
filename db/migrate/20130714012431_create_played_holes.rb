class CreatePlayedHoles < ActiveRecord::Migration
  def change
    create_table :played_holes do |t|
      t.integer :round_id
      t.integer :hole_id
      t.integer :fairway_id
      t.integer :GIR
      t.integer :putts
      t.integer :bunker
      t.integer :OB

      t.timestamps
    end
  end
end
