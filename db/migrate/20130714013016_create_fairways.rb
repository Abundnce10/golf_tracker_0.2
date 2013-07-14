class CreateFairways < ActiveRecord::Migration
  def change
    create_table :fairways do |t|
      t.string :fairway_accuracy

      t.timestamps
    end
  end
end
