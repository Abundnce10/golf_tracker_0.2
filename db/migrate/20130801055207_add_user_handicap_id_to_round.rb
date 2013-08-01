class AddUserHandicapIdToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :user_handicap_id, :integer
  end
end
