class CommentReferencesPost < ActiveRecord::Migration[6.0]
  def change
    add_reference(:comments, :post)
  end
end
