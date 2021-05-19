class Post < ApplicationRecord
  belongs_to :member
  has_many :comments
  has_many :members, through: :comments
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
end
