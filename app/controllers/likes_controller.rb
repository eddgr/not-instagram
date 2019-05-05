class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(like_params)
    if @like.save
      redirect_to @post
    end
  end

  def destroy
    @unlike = Like.find_by(like_params)
    @unlike.destroy
  end

  private
  def like_params
    params.require(:like).permit(:liker_id, :post_id)
  end
end
