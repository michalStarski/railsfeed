class Sub < ApplicationRecord
  has_one_attached :background_pic

  validates :name, presence: true
end
