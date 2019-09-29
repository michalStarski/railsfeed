class User < ApplicationRecord
  has_one_attached :avatar
  has_secure_password
  validates :email, :name, uniqueness: true
  validates :password, length: { minimum: 6 }
end
