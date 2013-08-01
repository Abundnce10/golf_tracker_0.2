class AddStartingHoleToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :starting_hole, :integer
  end
end
