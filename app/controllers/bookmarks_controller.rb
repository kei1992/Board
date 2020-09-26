class BookmarksController < ApplicationController

	def create
		board = Board.find(params[:board_id])
		board.bookmarks.create!(user_id: current_user.id)
		redirect_to boards_path(board)
	end

	def destroy
		board= Board.find(params[:board_id])
		bookmark = board.bookmarks.find_by!(user_id: current_user.id)
		bookmark.destroy
		redirect_to boards_path(board)
	end
end