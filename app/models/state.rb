# == Schema Information
#
# Table name: states
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  abbreviation :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class State < ActiveRecord::Base
  attr_accessible :abbreviation, :name

  has_many :addresses
  has_many :courses
end
