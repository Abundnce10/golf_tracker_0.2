# == Schema Information
#
# Table name: pars
#
#  id         :integer          not null, primary key
#  hole_id    :integer
#  gender_id  :integer
#  par        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Par < ActiveRecord::Base
  attr_accessible :gender_id, :hole_id, :par

  belongs_to :hole
  belongs_to :gender
end
