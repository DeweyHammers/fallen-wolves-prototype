class Post < ApplicationRecord
  belongs_to :member
  has_many :comments
  has_many :members, through: :comments
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true

  CATEGORIES = ['general', 'crafting', 'gathering', 'pvp', 'pve']

  def self.categories
    Hash.new.tap do |posts|
      CATEGORIES.each do |category|
        posts[category] = Post.where(category: category)
      end
    end
  end
end
