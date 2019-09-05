class AddDefaultValuesToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :likes, :integer, default: 0
    change_column :posts, :dislikes, :integer, default: 0
  end
end
