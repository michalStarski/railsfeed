class RemoveLikesDislikesFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :likes
    remove_column :comments, :dislikes
  end
end
