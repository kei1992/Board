# == Schema Information
#
# Table name: updates
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_updates_on_user_id  (user_id)
#
class Update < ApplicationRecord
	belongs_to :user
	has_one_attached :image
end
