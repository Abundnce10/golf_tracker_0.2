class ChangeTimeOfDayIdToHourOfDay < ActiveRecord::Migration
  def up
  	remove_column :rounds, :time_of_day_id
  	add_column :rounds, :hour_of_day, :integer
  end

  def down
  	remove_column :rounds, :hour_of_day
  	add_column :rounds, :time_of_day_id, :integer
  end
end
