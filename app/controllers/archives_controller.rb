class ArchivesController < ApplicationController
	before_action :authenticate_user!
	def create
		board = Board.find(params[:board_id])
		task = Task.find(params[:task_id])
		task.archives.create!(user_id: current_user.id)
		redirect_to board_task_path(board,task)
	end

	def destroy
		board = Board.find(params[:board_id])
		task = Task.find(params[:task_id])
		archive = task.archives.find_by!(user_id: current_user.id)
		archive.destroy!
		redirect_to board_task_path(board,task)
	end
end