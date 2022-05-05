class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :likeable, polymorphic: true
    end
      add_reference :likes, :writer, foreign_key: true
      add_index :likes, [:writer_id, :likeable_id, :likeable_type], unique: true
    end
end
