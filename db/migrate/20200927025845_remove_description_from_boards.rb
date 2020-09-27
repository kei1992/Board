class RemoveDescriptionFromBoards < ActiveRecord::Migration[6.0]
  def change
    remove_column :boards, :description, :text
  end
end
