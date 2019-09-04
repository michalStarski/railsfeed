class Post < ApplicationRecord
  belongs_to :author
  belongs_to :sub

  has_many_attached :images
end
