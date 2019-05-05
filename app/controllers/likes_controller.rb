class LikesController < ApplicationController

  # LIKE
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(like_params)
    if @like.save
      back
    end
  end

  # UNLIKE
  def destroy
    @unlike = Like.find_by(post_id: params[:post_id], liker_id: current_user.id)
    # could be refactored further, next steps
    @unlike.destroy
    back
  end

  # HELPER METHODS
  def back
    # redirects back to the previous page. If that doesn't exist, redirect to root path
    redirect_back(fallback_location: root_path)
  end

  # PRIVATE METHODS
  private

  def like_params
    params.require(:like).permit(:liker_id, :post_id)
  end
end
