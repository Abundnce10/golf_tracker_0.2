class CreateUserHandicaps < ActiveRecord::Migration
  def change
    create_table :user_handicaps do |t|
      t.integer :user_id
      t.integer :handicap

      t.timestamps
    end
  end
end
