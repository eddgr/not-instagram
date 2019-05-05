class LikesController < ApplicationController

  # LIKE
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(like_params)
    if @like.save
      redirect_to @post
    end
  end

  # UNLIKE
  def destroy
    @post = Post.find(params[:id])
    @unlike = Like.find_by(post: @post, liker_id: current_user.id)
    @unlike.destroy
    redirect_to @post
  end

  # PRIVATE METHODS
  private

  def like_params
    params.require(:like).permit(:liker_id, :post_id)
  end
end
