class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub

  has_rich_text :content

  validates :content, :title, :sub, presence: true
end
