class CreateCompletedHoles < ActiveRecord::Migration
  def change
    create_table :completed_holes do |t|
      t.integer :round_id
      t.integer :holes_completed

      t.timestamps
    end
  end
end
