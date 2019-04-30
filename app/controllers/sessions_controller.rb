class SessionsController < ApplicationController

  # CREATE
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    # authenticate is a built in rails method
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end

  # DESTROY
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
