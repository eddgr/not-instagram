class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post
    end
  end

  # PRIVATE METHODS
  private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end
end
