# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  state_id   :integer
#  street     :string(255)
#  city       :string(255)
#  zipcode    :integer
#  latitude   :string(255)
#  longitude  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ActiveRecord::Base
  attr_accessible :city_id, :latitude, :longitude, :state_id, :street, :zipcode_id

  belongs_to :city
  belongs_to :state
  belongs_to :zipcode
  has_many   :courses
end
