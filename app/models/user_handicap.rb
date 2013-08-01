# == Schema Information
#
# Table name: user_handicaps
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  handicap   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserHandicap < ActiveRecord::Base
  attr_accessible :handicap, :user_id

  has_many :rounds
end
