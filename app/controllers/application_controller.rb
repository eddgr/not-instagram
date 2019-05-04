class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    flash[:notice] = "You do not have access to do that."
    redirect_to root_path if !session.include? :user_id
  end
end
