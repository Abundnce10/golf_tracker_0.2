class CreateDriveDetails < ActiveRecord::Migration
  def change
    create_table :drive_details do |t|
      t.integer :played_hole_id
      t.integer :distance_of_drive
      t.boolean :on_fairway

      t.timestamps
    end
  end
end
