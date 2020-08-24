class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end

    def new
        @board = Board.new
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to board_path(@board), notice:'Sucess Save'
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