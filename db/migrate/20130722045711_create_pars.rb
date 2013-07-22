class CreatePars < ActiveRecord::Migration
  def change
    create_table :pars do |t|
      t.integer :hole_id
      t.integer :gender_id
      t.integer :par

      t.timestamps
    end
  end
end
