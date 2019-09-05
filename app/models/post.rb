class Post < ApplicationRecord
  belongs_to :user
  belongs_to :sub

  has_many_attached :images
end
