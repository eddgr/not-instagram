class PostsController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :post_edit, only: [:edit, :update, :destroy]

  # READ
  def index
    @posts = Post.all.order('posts.created_at DESC')
    # order by created_at in descending order so newest shows first

    # show only posts that contain photos in the index page
    @photos = @posts.select do |post|
      post.photo.attached?
    end.sample(9)

    # sort following feed by post date
    @feed = Post.sort_date(current_user) if session.include? :user_id
    # only run class method if user is logged in otherwise will break for guests
  end

  def show
    set_post
  end

  def explore
    # using the same @var as index
    @posts = Post.all.order('posts.created_at DESC')
    @photos = @posts.select do |post|
      post.photo.attached?
    end.sample(9)
  end

  def search
    @posts = Post.search(params[:search])
    if params[:search].nil?
      redirect_to root_path
    end
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
    params.require(:post).permit(:title, :user_id, :photo, :search)
  end

end
