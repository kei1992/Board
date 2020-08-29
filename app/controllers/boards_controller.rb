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
            redirect_to root_path, notice:'Success Save'
        else
            flash.now[:error] = 'Failed Save'
            render :new
        end
    end

    def edit
        @board = current_user.boards.find(params[:id])
    end

    def update
        @board = current_user.boards.find(params[:id])
        if @board.update(board_params)
            redirect_to root_path, notice: 'Completed Update'
        else
            flash.now[:error] = 'Failed Update'
            render :edit
        end
    end

    def destroy
        board = current_user.boards.find(params[:id])
        board.destroy!
        redirect_to root_path, notice: 'Completed Destroy'
    end

    private
    def board_params
        params.require(:board).permit(:name, :description)
    end
end
