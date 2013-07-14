# == Schema Information
#
# Table name: hole_notes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  round_id   :integer
#  hole_id    :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HoleNote < ActiveRecord::Base
  attr_accessible :hole_id, :note, :round_id, :user_id
end
