# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_board_id  (board_id)
#  index_favorites_on_user_id   (user_id)
#
class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :board

	validates :board_id, uniqueness: {scope: :user_id}
end
