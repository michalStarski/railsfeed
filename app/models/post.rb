class Post < ApplicationRecord
  has_many :comments

  belongs_to :user
  belongs_to :sub

  has_rich_text :content

  validates :content, :title, :sub, presence: true

  # If there are any images in the Post, return
  # the first one
  def thumbnail
    image = content.embeds.find { |e| e.image? }

    image || nil
  end
end
