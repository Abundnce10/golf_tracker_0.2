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
  attr_accessible :city, :latitude, :longitude, :state_id, :street, :zipcode


  validates :street, :city, :zipcode, presence: true
  validates :zipcode, :numericality => { :only_integer => true,
                                         :greater_than => 10000,
                                         :less_than    => 100000 }
end
