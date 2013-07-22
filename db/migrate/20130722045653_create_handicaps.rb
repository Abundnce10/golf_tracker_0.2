class CreateHandicaps < ActiveRecord::Migration
  def change
    create_table :handicaps do |t|
      t.integer :hole_id
      t.integer :gender_id
      t.integer :handicap

      t.timestamps
    end
  end
end
