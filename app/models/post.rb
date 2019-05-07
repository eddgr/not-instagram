class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :likes, dependent: :destroy
  has_many :likers, foreign_key: "liker_id", through: :likes
  validates :user_id, presence: true
  has_one_attached :photo
  validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
  # uses active_storage_validations gem

  # HELPER METHODS

  # search
  def self.search(search)
    if search
      post = Post.where("title LIKE ?", "%#{search}%")
      # search is based on title
      if post.any?
        self.where(id: post).order('posts.created_at DESC')
        # if posts exist, show posts by latest date
      else
        nil
        # if no post within params exist, return nil
        # creating logic for empty search results
      end
    else
      Post.all.order('posts.created_at DESC')
      # show all if there are no params
    end
  end

  # most liked post
  def self.most_liked
    Post.all.max_by {|post| post.likers.count}
  end

  # post likes
  def liked_by?(user_object)
    likers.include?(user_object)
  end

  # sort posts by created date for following feed
  def self.sort_date(user_object)
    # put all user's following posts in one array
    posts = user_object.following.map do |following|
      following.posts
    end.flatten
    # flatten removes empty arrays

    # sort post array by created date
    sort = posts.sort_by do |post|
      post.created_at
    end.reverse
    # reverse the order so the latest post appears first
  end

end
