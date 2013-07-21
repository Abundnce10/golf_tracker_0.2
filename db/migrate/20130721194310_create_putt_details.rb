class CreatePuttDetails < ActiveRecord::Migration
  def change
    create_table :putt_details do |t|
      t.string :played_hole_id
      t.integer :score_type_id
      t.integer :distance_from_hole
      t.boolean :make

      t.timestamps
    end
  end
end
