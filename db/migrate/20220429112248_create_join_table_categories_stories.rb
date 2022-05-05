class CreateJoinTableCategoriesStories < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :stories do |t|
      t.index [:category_id, :story_id]
      t.index [:story_id, :category_id]
    end
  end
end
