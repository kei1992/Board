# == Schema Information
#
# Table name: rooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Room < ApplicationRecord
	has_many :entries, dependent: :destroy
	has_many :direct_messages, dependent: :destroy
	has_many :users, through: :entries
end
