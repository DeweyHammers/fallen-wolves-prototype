class MembersController < ApplicationController
  before_action :logged_in?, only: [:index, :show]
  before_action :find_member, only: [:show, :edit, :update, :destroy]
  after_action :add_default_avatar, only: [:create]

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    @member.rank = 'Member'
   
    if @member.save
      session[:member_id] = @member.id
      redirect_to posts_path
    else
      redirect_to new_member_path, alert: @member.errors
    end
  end

  def index
    @members = Member.all
  end

  def show
  end

  def edit
    redirect_to member_path(@member) unless @member.id == current_member.id
  end

  def update
    @member.skip_password_length = true
    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      redirect_to edit_member_path(@member), alert: @member.errors
    end
  end

  def destroy
    @member.post_comments.each {|comment| comment.delete}
    @member.destroy
    session[:member_id] = nil
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def find_member
    @member = Member.find_by(id: params[:id])
  end
end