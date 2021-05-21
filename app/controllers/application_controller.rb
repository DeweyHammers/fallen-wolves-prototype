class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def home
    redirect_to posts_path unless session[:member_id] == nil
  end

  private

  def logged_in?
    redirect_to '/login' unless session[:member_id] != nil
  end
end
