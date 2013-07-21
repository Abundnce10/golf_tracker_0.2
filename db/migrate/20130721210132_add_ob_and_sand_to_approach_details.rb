class AddObAndSandToApproachDetails < ActiveRecord::Migration
  def change
    add_column :approach_details, :OB, :boolean
    add_column :approach_details, :sand, :boolean
  end
end
