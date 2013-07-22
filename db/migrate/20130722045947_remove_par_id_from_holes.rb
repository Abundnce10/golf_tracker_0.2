class RemoveParIdFromHoles < ActiveRecord::Migration
  def up
    remove_column :holes, :par_id
  end

  def down
    add_column :holes, :par_id, :integer
  end
end
