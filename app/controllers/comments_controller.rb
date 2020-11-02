class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        board = Board.find(params[:board_id])
        task = Task.find(params[:task_id])
        comments = task.comments
        render json:comments
    end

    def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build()
    end

    def create
        board = Board.find(params[:board_id])
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comments_params)

        @comment.save!
        render json: @comment
    end

    private
    def comments_params
        params.require(:comment).permit(:description).merge(user_id:current_user.id)
    end
end
