class AddUserIdToBoards < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :user
    #add_column :boards, :user_id, :integer
  end
end
