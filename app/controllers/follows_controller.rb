class FollowsController < ApplicationController
	def create
		current_user.follow!(params[:account_id])
		redirect_to account_path(params[:account_id])
	end
end