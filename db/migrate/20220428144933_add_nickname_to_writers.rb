class AddNicknameToWriters < ActiveRecord::Migration[5.2]
  def change
    add_column :writers, :nickname, :string
  end
end
