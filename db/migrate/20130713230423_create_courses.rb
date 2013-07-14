class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :address_id
      t.integer :course_type_id
      t.integer :fee_id
      t.integer :season_id
      t.string :website
      t.string :phone_number
      t.integer :number_of_holes

      t.timestamps
    end
  end
end
