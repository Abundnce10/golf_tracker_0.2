class CreateSlopeRatings < ActiveRecord::Migration
  def change
    create_table :slope_ratings do |t|
      t.integer :tee_id
      t.integer :gender_id
      t.integer :course_id
      t.integer :slope
      t.float :rating

      t.timestamps
    end
  end
end
