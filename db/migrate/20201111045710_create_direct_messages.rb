class CreateDirectMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_messages do |t|
      t.string :content
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
