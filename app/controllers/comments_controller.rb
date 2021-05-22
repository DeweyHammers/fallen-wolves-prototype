class CommentsController < ApplicationController
  before_action :find_post
  
  def create
    @post.comments.build(content: params[:comment][:content], member: current_user)

    if @post.save
      return_to_post
    else
      return_to_post
    end
  end

  def destroy
    comment = @post.comments.find_by(id: params[:id])
    comment.delete
    return_to_post
  end

  def update
    byebug
  end

  private

  def find_post
    @post = Post.find_by(id: params[:post_id])
  end

  def return_to_post
    redirect_to post_path(@post)
  end
end
