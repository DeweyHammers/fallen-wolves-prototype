class Member < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :comment_posts, through: :posts, source: :post
  has_one_attached :avatar
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password_digest,presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: true
end
