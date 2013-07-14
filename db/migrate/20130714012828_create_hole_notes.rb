class CreateHoleNotes < ActiveRecord::Migration
  def change
    create_table :hole_notes do |t|
      t.integer :user_id
      t.integer :round_id
      t.integer :hole_id
      t.text :note

      t.timestamps
    end
  end
end
