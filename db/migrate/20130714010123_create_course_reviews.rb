class CreateCourseReviews < ActiveRecord::Migration
  def change
    create_table :course_reviews do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
