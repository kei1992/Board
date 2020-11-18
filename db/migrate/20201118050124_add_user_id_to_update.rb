class AddUserIdToUpdate < ActiveRecord::Migration[6.0]
  def change
    add_reference :updates, :user
  end
end
