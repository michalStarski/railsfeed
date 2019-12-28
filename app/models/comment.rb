class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_rich_text :content
  validates :content, :post, :user, presence: true
end
