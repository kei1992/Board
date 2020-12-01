class Admin::UpdatesController < ApplicationController
	before_action :if_not_admin

	def index
		@updates = Update.all
	end

	def new
		admin = User.find(1)
		@update = admin.updates.build
	end

	def create
		admin = User.find(1)
		@update = admin.updates.build(update_params)
		if @update.save
			redirect_to updatesnew_index_path
		else
			render :new
		end
	end

	private
	def update_params
		params.require(:update).permit(:title, :description, :image)
	end

	def if_not_admin
		redirect_to root_path unless current_user.admin?
	end
end
