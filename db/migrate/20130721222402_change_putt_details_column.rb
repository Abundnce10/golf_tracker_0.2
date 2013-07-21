class ChangePuttDetailsColumn < ActiveRecord::Migration
  def up
  	rename_column :putt_details, :score_type_id, :shot_number
  end

  def down
  	rename_column :putt_details, :shot_number, :score_type_id
  end
end
