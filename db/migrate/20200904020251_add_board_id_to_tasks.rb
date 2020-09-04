class AddBoardIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :board, foreign_key: true
  end
end
