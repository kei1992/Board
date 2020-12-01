class FollowsController < ApplicationController
	def create
		current_user.follow!(params[:account_id])
		@user = User.find(params[:account_id])
		@user.create_notification_follow!(current_user)
		if request.referer&.include?('/users/index')
			redirect_to users_index_path
		else
			redirect_to account_path(params[:account_id])
		end
	end
end
