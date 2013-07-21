class RemoveGenderTeesFromGenders < ActiveRecord::Migration
  def up
    remove_column :genders, :gender_tees
  end

  def down
    add_column :genders, :gender_tees, :string
  end
end
