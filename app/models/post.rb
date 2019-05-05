class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  has_many :likes
  has_many :likers, foreign_key: "liker_id", through: :likes
  validates :user_id, presence: true
  has_one_attached :photo
  validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
  # uses active_storage_validations gem

  # HELPER METHODS

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
