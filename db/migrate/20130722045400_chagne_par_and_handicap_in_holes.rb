class ChagneParAndHandicapInHoles < ActiveRecord::Migration
  def up
  	remove_column :holes, :par
  	add_column    :holes, :par_id, :integer
  	remove_column :holes, :handicap
  	add_column    :holes, :handicap_id, :integer
  end

  def down
  	remove_column :holes, :par_id
  	add_column    :holes, :par, :integer
  	remove_column :holes, :handicap_id
  	add_column    :holes, :handicap, :integer
  end
end
