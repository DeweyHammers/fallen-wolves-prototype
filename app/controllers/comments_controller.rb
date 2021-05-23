class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:update, :destroy]
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.member = current_user

    if @comment.save
      return_to_post
    else
      flash.alert = @comment.errors.full_messages
      return_to_post
    end
  end

  def update
    if @comment.update(comment_params)  
      return_to_post 
    else
      flash.alert = @comment.errors.full_messages
      return_to_post 
    end
  end

  def destroy
    @comment.delete
    return_to_post
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
    @post = Post.find_by(id: params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find_by(id: params[:id])
  end

  def return_to_post
    redirect_to post_path(@post)
  end
end
