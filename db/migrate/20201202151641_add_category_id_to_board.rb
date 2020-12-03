class AddCategoryIdToBoard < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :category
  end
end
