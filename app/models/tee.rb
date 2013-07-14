# == Schema Information
#
# Table name: tees
#
#  id         :integer          not null, primary key
#  tee_type   :string(255)
#  color      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tee < ActiveRecord::Base
  attr_accessible :color, :tee_type
end
