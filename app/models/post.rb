class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub

  has_rich_text :content

  validates :content, :title, :sub, presence: true

  # If there are any images in the Post, return
  # the first one
  def thumbnail
    image = content.embeds.find { |e| e.image? }
    puts image

    return image || nil
  end
end
