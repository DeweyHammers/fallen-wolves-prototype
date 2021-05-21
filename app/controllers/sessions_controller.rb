class SessionsController < ApplicationController
  def new 
  end

  def create
    member = Member.find_by(username: params[:member][:username])

    if member && member.authenticate(params[:member][:password])
      session[:member_id] = member.id
      redirect_to posts_path
    else
      redirect_to '/login'
    end
  end

  def destory
    session[:member_id] = nil
    redirect_to root_path
  end
end
