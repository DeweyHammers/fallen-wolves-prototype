class PostsController < ApplicationController
  before_action :logged_in?
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.posts_catergorized
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)
    @post.member = current_member

    if @post.save  
      redirect_to post_path(@post) 
    else
      redirect_to new_post_path, alert: @post.errors
    end
  end

  def show
  end

  def edit
    redirect_to post_path(@post) unless @post.member.id == current_member.id
  end

  def update
    if @post.update(post_params) 
      redirect_to post_path(@post) 
    else
      redirect_to edit_post_path(@post), alert: @post.errors
    end
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