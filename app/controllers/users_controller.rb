class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :user_edit, only: [:edit, :update, :destroy]

  # READ
  def index
    @users = User.all
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    set_user
  end

  def following
    @following = set_user.following
  end

  def followers
    @followers = set_user.followers
  end

  # CREATE
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully signed up!"
      session[:user_id] = @user.id
      # log in after signing up
      redirect_to @user
    else
      render :new
    end
  end

  # UPDATE
  def edit
    set_user
  end

  def update
    set_user.update(user_params)
    if @user.save
      flash[:success] = "Profile successfully updated!"
      redirect_to @user
    else
      render :edit
    end
  end

  # DESTROY
  def destroy
    set_user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  # HIDDEN METHODS
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
