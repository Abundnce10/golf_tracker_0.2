class AddScrambleToPlayedHoles < ActiveRecord::Migration
  def change
    add_column :played_holes, :scramble, :integer
  end
end
