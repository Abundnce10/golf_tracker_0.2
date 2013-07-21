class CreateApproachDetails < ActiveRecord::Migration
  def change
    create_table :approach_details do |t|
      t.integer :played_hole_id
      t.integer :score_type_id
      t.integer :distance_from_hole
      t.boolean :on_green
      t.boolean :in_the_hole

      t.timestamps
    end
  end
end
