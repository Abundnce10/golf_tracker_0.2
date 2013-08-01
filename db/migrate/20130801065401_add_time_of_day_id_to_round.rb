class AddTimeOfDayIdToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :time_of_day_id, :integer
  end
end
