class UpdatesnewController < ApplicationController
	def index
		@updates = Update.all
	end
end