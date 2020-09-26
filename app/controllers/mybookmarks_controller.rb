class MybookmarksController < ApplicationController
	before_action :authenticate_user!

	def index
		@boards = current_user.my_bookmarks
		
	end
end