# == Schema Information
#
# Table name: zipcodes
#
#  id         :integer          not null, primary key
#  zipcode    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Zipcode < ActiveRecord::Base
  attr_accessible :zipcode

  has_many :addresses
  has_many :courses
end
