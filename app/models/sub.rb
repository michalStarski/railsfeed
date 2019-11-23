class Sub < ApplicationRecord
  has_one_attached :background_pic
  has_and_belongs_to_many :users

  validates :name, presence: true
end
