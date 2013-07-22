class AddCourseIdToPars < ActiveRecord::Migration
  def change
    add_column :pars, :course_id, :integer
  end
end
