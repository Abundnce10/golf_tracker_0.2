class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :course_id
      t.integer :tee_id
      t.integer :gender_id
      t.integer :number
      t.integer :distance
      t.integer :par
      t.integer :handicap

      t.timestamps
    end
  end
end
