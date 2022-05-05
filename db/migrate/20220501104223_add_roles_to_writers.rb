class AddRolesToWriters < ActiveRecord::Migration[5.2]
  def change
    add_column :writers, :role, :integer, default: 0
  end
end
