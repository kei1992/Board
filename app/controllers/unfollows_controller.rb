class UnfollowsController < ApplicationController
	before_action :authenticate_user!

	def create
		current_user.unfollow!(params[:account_id])
		if request.referer&.include?('/users/index')
			redirect_to users_index_path
		else
			redirect_to account_path(params[:account_id])
		end
	end
end
