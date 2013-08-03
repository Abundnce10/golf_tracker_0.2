class AddGenderIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender_id, :integer, default: 1
  end
end
