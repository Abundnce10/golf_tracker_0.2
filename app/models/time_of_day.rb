# == Schema Information
#
# Table name: time_of_days
#
#  id          :integer          not null, primary key
#  time_of_day :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TimeOfDay < ActiveRecord::Base
  attr_accessible :time_of_day

  has_many :rounds
end
