class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub

  has_many_attached :images

  validates :content, :title, :sub, presence: true
end
