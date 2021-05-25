class SessionsController < ApplicationController
  after_action :add_default_avatar, only: [:omniauth]

  def new 
  end

  def create
    member = Member.find_by(username: params[:member][:username])
    if member && member.authenticate(params[:member][:password])
      session[:member_id] = member.id
      redirect_to posts_path
    else
      redirect_to '/login', alert: 'Username or Password was not found'
    end
  end

  def omniauth
    @member = Member.create_from_omniauth(auth)
    @member.skip_password_length = true
    if @member.valid?
      session[:member_id] = @member.id
      redirect_to posts_path
    else
      redirect_to '/login', alert: @member.errors
    end
  end

  def destory
    session[:member_id] = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end