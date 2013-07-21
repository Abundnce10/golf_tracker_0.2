class AddObAndSandToDriveDetails < ActiveRecord::Migration
  def change
    add_column :drive_details, :OB, :boolean
    add_column :drive_details, :sand, :boolean
  end
end
