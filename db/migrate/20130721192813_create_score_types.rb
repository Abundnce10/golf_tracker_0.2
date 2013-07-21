class CreateScoreTypes < ActiveRecord::Migration
  def change
    create_table :score_types do |t|
      t.string :score_type
      t.integer :score_relative_to_par

      t.timestamps
    end
  end
end
