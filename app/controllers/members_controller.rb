class MembersController < ApplicationController
  before_action :logged_in?, only: [:index, :show]

  def new
    @member = Member.new
  end

  def create
    member = Member.new(member_params)
    member.rank = 'Member'

    if member.save
      session[:member_id] = @member.id
      redirect_to posts_path
    else
      redirect_to new_member_path, alert: member.errors.full_messages
    end
  end

  def index
    @members = Member.all
  end

  def show
    @member = Member.find_by(id: params[:id])
  end

  private

  def member_params
    params.require(:member).permit(:username, :email, :password, :password_confirmation, :avatar)
  end
end
