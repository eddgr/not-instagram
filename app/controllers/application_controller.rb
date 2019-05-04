class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :require_login, :post_id, :user_edit

  # these methods accessible by all controllers since they are child of ApplicationController

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    # redirects to main page if user is not logged in
    redirect_to root_path if !session.include? :user_id
  end

  # current user can only edit own post
  def post_edit
    @post = Post.find(params[:id])
    redirect_to @post if @post.user != current_user
  end

  # current user can only edit own profile
  def user_edit
    @user = User.find(params[:id])
    redirect_to @user if @user != current_user
  end
end
