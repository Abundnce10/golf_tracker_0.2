# == Schema Information
#
# Table name: fees
#
#  id         :integer          not null, primary key
#  weekday_18 :float
#  weekday_9  :float
#  weekend_18 :float
#  weekend_9  :float
#  twilight   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fee < ActiveRecord::Base
  attr_accessible :twilight, :weekday_18, :weekday_9, :weekend_18, :weekend_9

  has_one :courses

  # maximum of 2 decimal places
  validates :weekday_18, :weekday_9, :weekend_18, :weekend_9, :twilight, 
                    :format => { :with => /^\d+??(?:\.\d{0,1})?$/ }
end
