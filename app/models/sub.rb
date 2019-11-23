class Sub < ApplicationRecord
  has_one_attached :background_pic
  has_many :follows

  validates :name, presence: true
end
