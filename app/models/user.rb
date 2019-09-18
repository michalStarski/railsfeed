class User < ApplicationRecord
  has_secure_password
  validates :email, :name, uniqueness: true
end
