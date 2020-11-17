class UpdatesController < ApplicationController
	before_action :authenticate_user!
	def index
		@updates = Update.all
	end

	def new
		@update = current_user.updates.build()
	end

	def create
		@update = update.build(update_params)
		if @update.save
			redirect_to updates_path
		else
			render :new
		end
	end

	private
	def update_params
		require(:update).permit(:title,:description)
	end
end
