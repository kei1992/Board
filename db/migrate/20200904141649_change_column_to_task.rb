class ChangeColumnToTask < ActiveRecord::Migration[6.0]
  def up
    change_column :tasks, :deadline, :date, null: true
  end

  def down
    change_column :tasks, :deadline, :date, null: false
  end
end
