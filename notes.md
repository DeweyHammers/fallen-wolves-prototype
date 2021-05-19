# MODELS

# Member
  * has_many :posts
  * has_many :comments
  * has_many :comment_posts, through :comments, source: :post
  * has_one_attached :avatar
  * has_secure_password
    * validates :username, presence: true, uniqueness: true
    * validates :password_digest,presence: true, length: { minimum: 8 }
    * validates :email, presence: true, uniqueness: true
      * username
      * password_digest
      * email
      * rank

# Post
  * belongs_to :member
  * has_many :comments
  * has_many :members, through :comments
    * validates :title, presence: true
    * validates :content, presence: true
    * validates :category, presence: true
      * title
      * content
      * category
      * user_id

# Comment
  * belongs_to :member
  * belongs_to :post
    * validates :content, presence: true
      * content
      * post_id
      * user_id
