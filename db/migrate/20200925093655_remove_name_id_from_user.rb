class RemoveNameIdFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name_id, :bigint
  end
end
