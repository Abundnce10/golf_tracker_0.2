class CreateRoundNotes < ActiveRecord::Migration
  def change
    create_table :round_notes do |t|
      t.integer :round_id
      t.text :note

      t.timestamps
    end
  end
end
