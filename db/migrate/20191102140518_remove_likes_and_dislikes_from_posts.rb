class RemoveLikesAndDislikesFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :likes
    remove_column :posts, :dislikes
  end
end
