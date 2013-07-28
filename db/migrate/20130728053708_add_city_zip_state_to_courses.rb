class AddCityZipStateToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :city_id, :integer
    add_column :courses, :state_id, :integer
    add_column :courses, :zipcode_id, :integer
  end
end
