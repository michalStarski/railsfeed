class RemoveContentColumnFromPostAndComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :content
    remove_column :comments, :content
  end
end
