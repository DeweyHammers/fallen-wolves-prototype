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


# WEBSITE LAYOUT

  # Home Page
  * main page is covered with a wolve picute
  * has some text welcoming the user to the home page 
    * Welcome to the home of the Fallen Wolves community
    * Please login or signup
  * has a login or signup button in the center of the screen
  
  # Login / Signup
    * Lets the user either login/signup
    * Also lets the user signup/login through google

  # Members Page
    * This page will display all the members by there avater with there name and guild rank listed
    * A user can click on the user and see there profile page
    * See all the posts/comments that a user has made
    * Can update member info they own that account  

  # Form Page
    * This page will have a list of Five categories (General, Crafting, PvP, PvE, Raids)
    * The posts will be categoriezed by the category they are part of
    * The user can click on a post to see it or make a new post

  # New Post Page
    * The member can make a new post

  # Post Show Page
    * The memeber can read the post and Edit it if they own that post 
    * Members can make a comment on the post and edit it if they own it