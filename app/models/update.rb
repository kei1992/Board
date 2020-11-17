# == Schema Information
#
# Table name: updates
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Update < ApplicationRecord
	belongs_to :user
	has_one_attached :images
end
