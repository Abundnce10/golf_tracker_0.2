class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :state_id
      t.string :street
      t.string :city
      t.integer :zipcode
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
