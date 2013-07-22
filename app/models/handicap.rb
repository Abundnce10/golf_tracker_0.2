# == Schema Information
#
# Table name: handicaps
#
#  id         :integer          not null, primary key
#  hole_id    :integer
#  gender_id  :integer
#  handicap   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Handicap < ActiveRecord::Base
  attr_accessible :gender_id, :handicap, :hole_id

  belongs_to :hole
  belongs_to :gender
end
