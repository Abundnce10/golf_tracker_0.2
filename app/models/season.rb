# == Schema Information
#
# Table name: seasons
#
#  id          :integer          not null, primary key
#  seasonality :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Season < ActiveRecord::Base
  attr_accessible :seasonality
end
