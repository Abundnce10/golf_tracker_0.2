# == Schema Information
#
# Table name: courses
#
#  id              :integer          not null, primary key
#  address_id      :integer
#  course_type_id  :integer
#  fee_id          :integer
#  season_id       :integer
#  website         :string(255)
#  phone_number    :string(255)
#  number_of_holes :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Course < ActiveRecord::Base
  attr_accessible :address_id, :course_type_id, :fee_id, :number_of_holes, :phone_number, :season_id, :website

  validates :address_id, :course_type_id, :fee_id, :season_id, :presence => true
  validates :number_of_holes, :numericality => { :only_integer => true }

end
