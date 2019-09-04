class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :author, null: false, foreign_key: true
      t.string :title
      t.integer :likes
      t.references :sub, null: false, foreign_key: true
      t.integer :dislikes

      t.timestamps
    end
  end
end
