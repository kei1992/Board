class ArchivesController < ApplicationController
	before_action :authenticate_user!
	def create
		task = Task.find(params[:task_id])
		task.archives.create!(user_id: current_user.id)
		redirect_to board_task_path(board,task)
	end

	def destroy

	end
end