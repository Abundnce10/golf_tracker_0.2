class ChangeCityAndZipcode < ActiveRecord::Migration
  def up
  	remove_column :addresses, :city
  	add_column    :addresses, :city_id, :integer
	remove_column :addresses, :zipcode
  	add_column    :addresses, :zipcode_id, :integer
  end

  def down
	remove_column :addresses, :city_id
  	add_column    :addresses, :city, :string
	remove_column :addresses, :zipcode_id
  	add_column    :addresses, :zipcode, :integer
  end
end
