class TasksController < ApplicationController
    before_action :authenticate_user!

    def new
      @board = Board.find(params[:board_id])
      @task = @board.tasks.build()
    end

    def create
      @board = Board.find(params[:board_id])
      @task = @board.tasks.build(task_params)

      if @task.save
        redirect_to board_path(@board), notice: 'コメントを追加'
      else
        flash.now[:error] = '更新できませんでした'
        render :new
      end
    end

    private
    def task_params
        params.require(:task).permit(:name,:description).merge(user_id: current_user.id)
    end
end
