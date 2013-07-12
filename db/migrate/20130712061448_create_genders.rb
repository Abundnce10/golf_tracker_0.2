class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :gender_type
      t.string :gender_tees

      t.timestamps
    end
  end
end
