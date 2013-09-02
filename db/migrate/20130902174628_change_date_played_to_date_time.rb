class ChangeDatePlayedToDateTime < ActiveRecord::Migration
  def up
  	change_column :rounds, :date_played, :datetime
  end

  def down
  	change_column :rounds, :date_played, :date
  end
end
