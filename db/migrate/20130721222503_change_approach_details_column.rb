class ChangeApproachDetailsColumn < ActiveRecord::Migration
  def up
  	rename_column :approach_details, :score_type_id, :shot_number
  end

  def down
  	rename_column :approach_details, :shot_number, :score_type_id
  end
end
