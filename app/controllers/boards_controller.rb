class BoardsController < ApplicationController
    before_action :authenticate_user!

    def index
        @boards = Board.all
    end

    def show
        @board = Board.find(params[:id])
    end

    def new
        @board = Board.new
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to board_path(@board), notice:'Success Save'
        else
            flash.now[:error] = 'Failed Save'
            render :new
        end
    end

    private
    def board_params
        params.require(:board).permit(:name, :description)
    end
end
