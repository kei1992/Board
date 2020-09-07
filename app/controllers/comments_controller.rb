class CommentsController < ApplicationController
    def new
        board = Board.find(params[:id])
        task = board.tasks.find(params[:id])
        @comment = task.comments.build()
    end
end