class FavoritesController < ApplicationController
	def show
		favorite = Favorite.find(params[:id])
		favorite_status = favorite.board.create_notification_like!(current_user)
		render json:favorite_status
	end

	def create
		favorite = current_user.favorites.create!(favorite_params)
		favorite_status = favorite.board.create_notification_like!(current_user)
		render json: favorite
	end

	def destroy
		favorite = Favorite.find(params[:id])
		favorite.destroy!
		render json: favorite
	end

	private

	def favorite_params
		params.require(:favorite).permit(:board_id)
	end
end
