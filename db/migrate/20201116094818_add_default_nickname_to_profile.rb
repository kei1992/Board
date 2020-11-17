class AddDefaultNicknameToProfile < ActiveRecord::Migration[6.0]
  def up
    change_column :profiles, :nickname, :string,default: 'Noname'
  end

  def down
    change_column :profiles, :nickname, :string
  end
end
