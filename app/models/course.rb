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
#  name            :string(255)
#  city_id         :integer
#  state_id        :integer
#  zipcode_id      :integer
#

class Course < ActiveRecord::Base
  attr_accessible :address_id, :city_id, :course_type_id, :fee_id, :name, :number_of_holes, :phone_number, :season_id, :state_id, :website, :zipcode_id

  belongs_to :address
  belongs_to :course_type
  belongs_to :fee
  belongs_to :season
  belongs_to :city
  belongs_to :state
  belongs_to :zipcode
  has_many   :course_reviews
  has_many   :holes
  has_many   :handicaps
  has_many   :pars
  has_many   :rounds
  has_many   :slope_ratings

  validates :address_id, :course_type_id, :fee_id, :season_id, :name, :presence => true
  validates :number_of_holes, :numericality => { :only_integer => true }
end
