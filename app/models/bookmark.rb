# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_bookmarks_on_board_id  (board_id)
#  index_bookmarks_on_user_id   (user_id)
#
class Bookmark < ApplicationRecord
	belongs_to :user
	belongs_to :board
end
