class RemoveGenderIdFromHoles < ActiveRecord::Migration
  def up
    remove_column :holes, :gender_id
  end

  def down
    add_column :holes, :gender_id, :integer
  end
end
