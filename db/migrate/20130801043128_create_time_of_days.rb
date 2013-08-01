class CreateTimeOfDays < ActiveRecord::Migration
  def change
    create_table :time_of_days do |t|
      t.string :time_of_day

      t.timestamps
    end
  end
end
