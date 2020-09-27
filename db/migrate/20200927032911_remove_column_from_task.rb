class RemoveColumnFromTask < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :description, :text
  end
end
