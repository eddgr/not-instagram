class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :require_login

  # these methods accessible by all controllers since they are child of ApplicationController

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    # redirects to main page if user is not logged in
    redirect_to root_path if !session.include? :user_id
  end
end
