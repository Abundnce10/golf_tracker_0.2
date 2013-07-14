# == Schema Information
#
# Table name: round_notes
#
#  id         :integer          not null, primary key
#  round_id   :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoundNote < ActiveRecord::Base
  attr_accessible :note, :round_id
end
