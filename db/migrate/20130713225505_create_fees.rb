class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.float :weekday_18
      t.float :weekday_9
      t.float :weekend_18
      t.float :weekend_9
      t.float :twilight

      t.timestamps
    end
  end
end
