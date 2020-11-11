class ArchivesController < ApplicationController
	before_action :authenticate_user!

	def show
		board = Board.find(params[:board_id])
		task = Task.find(params[:task_id])
		archive_status = current_user.has_archivetasked?(board,task)
		render json:{hasArchive: archive_status}
	end

	def create
		board = Board.find(params[:board_id])
		task = Task.find(params[:task_id])
		task.archives.create!(user_id: current_user.id,board_id: board.id)
		redirect_to board_tasks_path
	end

	def destroy
		board = Board.find(params[:board_id])
		task = Task.find(params[:task_id])
		archive = task.archives.find_by!(user_id: current_user.id,board_id: board.id)
    archive.destroy
		redirect_to board_tasks_path
	end
end
