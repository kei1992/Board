class CategoriesController < ApplicationController
	def index
		@category_parents = Category.all.order("id ASC")
	end
end