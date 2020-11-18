class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
      @board = Board.find(params[:board_id])
      @tasks = @board.tasks.page(params[:page]).per(4)
    end

    def show
      @board = Board.find(params[:board_id])
      @task = Task.find(params[:id])
    end

    def new
      @board = Board.find(params[:board_id])
      @task = @board.tasks.build
    end

    def create
      @board = Board.find(params[:board_id])
      @task = @board.tasks.build(task_params)

      if @task.save
        redirect_to board_tasks_path(@board), notice: 'Completed Upload'
      else
        flash.now[:error] = 'Failed Upload'
        render :new
      end
    end

    def edit
      @board = Board.find(params[:board_id])
      @task = current_user.tasks.find(params[:id])
    end

    def update
      @board = Board.find(params[:board_id])
      @task = current_user.tasks.find(params[:id])

      if @task.update(task_params)
        redirect_to board_task_path(@board,@task),notice: 'Completed Update'
      else
        flash.now[:error] = 'Failed Update'
        render :edit
      end
    end

    def destroy
      board = Board.find(params[:board_id])
      task = current_user.tasks.find(params[:id])
      task.destroy
      redirect_to board_path(board), notice:'Completed Destroy'
    end

    private
    def task_params
        params.require(:task).permit(:name,:description,:deadline,:eyecatch).merge(user_id: current_user.id)
    end
end
