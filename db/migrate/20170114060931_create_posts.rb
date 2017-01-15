class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :message
      t.string :title
      t.integer :category_id
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
