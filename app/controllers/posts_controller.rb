class PostsController < ApplicationController

  # READ
  def index
    @posts = Post.all.order('posts.created_at DESC')

    # show only posts that contain photos in the index page
    # order by created_at in descending order so newest shows first
    @photos = @posts.order("created_at DESC").select do |post|
      post.photo.attached?
    end
  end

  def show
    set_post
  end

  # CREATE
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Successfully posted!"
      redirect_to @post
    else
      render :new
    end
  end

  # UPDATE
  def edit
    set_post
  end

  def update
    if set_post.update(post_params)
      flash[:success] = "Post successfully updated!"
      redirect_to set_post
    else
      render :edit
    end
  end

  # DESTROY
  def destroy
    flash[:success] = "Post successfully deleted!"
    set_post.destroy
    redirect_to user_path(current_user)
  end

  # HIDDEN METHODS
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :photo)
  end

end
