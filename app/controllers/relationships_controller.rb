class RelationshipsController < ApplicationController

  # CREATE == FOLLOW
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  # DESTROY == UNFOLLOW
  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end

end
