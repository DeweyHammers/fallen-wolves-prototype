class ApplicationController < ActionController::Base
  helper_method :current_member

  def index
    redirect_to posts_path unless session[:member_id] == nil
  end

  private

  def logged_in?
    redirect_to '/login' unless session[:member_id] != nil
  end

  def current_member
    Member.find_by(id: session[:member_id]) 
  end

  def add_default_avatar
    unless @member.avatar.attached?
      @member.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default_profile.png")), filename: 'default_profile.png' , content_type: "image/png")
    end
  end
end