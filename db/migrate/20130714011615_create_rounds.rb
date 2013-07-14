class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :tee_id
      t.date :date_played

      t.timestamps
    end
  end
end
