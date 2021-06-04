class Post < ApplicationRecord
  belongs_to :member
  has_many :comments
  has_many :members, through: :comments
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  scope :catergorized_posts, -> (category){ where(category: category) }

  CATEGORIES = ['general', 'crafting', 'gathering', 'pvp', 'pve']

  def self.posts_catergorized
    Hash.new.tap do |posts|
      CATEGORIES.each do |category|
        posts[category] = catergorized_posts(category)
      end
    end
  end
end
