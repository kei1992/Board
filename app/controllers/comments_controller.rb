class CommentsController < ApplicationController
    def index
        task = Task.find(params[:task_id])
        comments = task.comments
    end

    def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build()
    end

    def create
        board = Board.find(params[:board_id])
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comments_params)

        if @comment.save
            redirect_to board_task_path(board,task), notice:'Saved comment'
        else
            flash.now[:error] = 'Failed to save'
            render :new
        end
    end

    private
    def comments_params
        params.require(:comment).permit(:description).merge(user_id:current_user.id)
    end
end