class User < ApplicationRecord
  has_secure_password
  validates :email, :name, uniqueness: true
  validates :password, length: { minimum: 6 }
end
