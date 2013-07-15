class AddStrokesToPlayedHoles < ActiveRecord::Migration
  def change
    add_column :played_holes, :strokes, :integer
  end
end
