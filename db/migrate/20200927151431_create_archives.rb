class CreateArchives < ActiveRecord::Migration[6.0]
  def change
    create_table :archives do |t|
      t.references :user, null: :false
      t.references :task, null: :false
      t.timestamps
    end
  end
end
