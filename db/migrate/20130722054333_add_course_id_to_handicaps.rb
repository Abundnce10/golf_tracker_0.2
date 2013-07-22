class AddCourseIdToHandicaps < ActiveRecord::Migration
  def change
    add_column :handicaps, :course_id, :integer
  end
end
