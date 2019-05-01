class Post < ApplicationRecord
  belongs_to :user
  # belongs_to :follower, foreign_key: :follower_id, class_name: "User"
  # belongs_to :following, foreign_key: :following_id, class_name: "User"
  validates :title, presence: true
  validates :user_id, presence: true
  has_one_attached :photo
end
