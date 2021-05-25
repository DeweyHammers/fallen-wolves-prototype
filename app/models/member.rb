class Member < ApplicationRecord
  attr_accessor :skip_password_length
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :post_comments, through: :posts, source: :comments
  has_one_attached :avatar
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, unless: :skip_password_length
  validates :email, presence: true, uniqueness: true

  def self.create_from_omniauth(auth)
    self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |member|
      member.username = auth['info']['first_name']
      member.email = auth['info']['email']
      member.rank = "Member"
      member.password = SecureRandom.hex(16)
    end
  end
end
