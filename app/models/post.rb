class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
end
