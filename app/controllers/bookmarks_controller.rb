class BookmarksController < ApplicationController

	def show
		board = Board.find(params[:board_id])
		bookmark_status = current_user.has_bookmarked?(board)
		render json:{hasBookmarked: bookmark_status}
	end

	def create
		board = Board.find(params[:board_id])
		board.bookmarks.create!(user_id: current_user.id)
		redirect_to boards_path
	end

	def destroy
		board= Board.find(params[:board_id])
		bookmark = board.bookmarks.find_by!(user_id: current_user.id)
		bookmark.destroy
		redirect_to boards_path
	end
end
