class User < ApplicationRecord
  has_one_attached :avatar

  validates :email, :password, :name, presence: true
  validates :password, confirmation: true
  validates :password, length: { in: 6..20 }
  validates :name, length: { minimum: 2 }
  validates :email, :name, uniqueness: true
end
