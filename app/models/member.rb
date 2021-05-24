class Member < ApplicationRecord
  attr_accessor :skip_password
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :comment_posts, through: :posts, source: :post
  has_one_attached :avatar
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, unless: :skip_password
  validates :email, presence: true, uniqueness: true
end
