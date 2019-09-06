class User < ApplicationRecord
  has_one_attached :avatar

  validates :email, :password, :name, presence: true
end
