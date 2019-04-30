class UsersController < ApplicationController

  # READ
  def index
    @users = User.all
  end

  def show
    set_user
  end

  # CREATE
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully signed up!"
      redirect_to @user
    else
      flash[:danger] = "Your account was not created, try again"
      redirect_to new_user_path
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
      flash[:danger] = "Your profile was not updated, try again!"
      redirect_to edit_user_path
    end
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
