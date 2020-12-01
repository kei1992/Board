class BoardsController < ApplicationController
    before_action :authenticate_user!, only:[:new,:create,:edit,:update,:destroy]
    skip_before_action :verify_authenticity_token

    def index
        @boards = Board.all.includes(:users).page(params[:page]).per(8)
        @q = Board.ransack(params[:q])
        @boards = @q.result(distinct: true).page(params[:page]).per(8)
        if params[:tag_name]
            @boards = Board.tagged_with("#{params[:tag_name]}").page(params[:page]).per(12)
        end
    end

    def new
        @board = current_user.boards.build
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to root_path
        else
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
        params.require(:board).permit(:name, :content, :tag_list)
    end
end
