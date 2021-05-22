class PostsController < ApplicationController
  before_action :logged_in?
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.categories
  end

  def new
    @post = Post.new 
  end

  def create
    post = Post.new(post_params)
    post.member = current_user

    redirect_to post.save ? post_path(post) : new_post_path(post)
  end

  def show
    if params[:edit_comment]
      @post = Post.find_by(id: params[:post_id])
      @comment = @post.comments.find_by(id: params[:id])
      @edit_comment = params[:edit_comment]
    end
  end

  def edit
    redirect_to post_path(@post) unless @post.member.id == current_user.id
  end

  def update
    redirect_to @post.update(post_params) ? post_path(@post) : edit_post_path(@post)
  end
  
  def destroy
    @post.delete
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
