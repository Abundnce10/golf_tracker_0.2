class RemoveHandicapIdFromHoles < ActiveRecord::Migration
  def up
    remove_column :holes, :handicap_id
  end

  def down
    add_column :holes, :handicap_id, :integer
  end
end
