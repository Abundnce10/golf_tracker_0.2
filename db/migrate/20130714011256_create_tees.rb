class CreateTees < ActiveRecord::Migration
  def change
    create_table :tees do |t|
      t.string :tee_type
      t.string :color

      t.timestamps
    end
  end
end
