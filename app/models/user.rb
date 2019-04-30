class User < ApplicationRecord
  has_many :posts
  # has_many :relationships
  # has_many :followers, foreign_key: :follower_id, through: :relationships
  # has_many :following, foreign_key: :following_id, through: :relationships
  validates :name, presence: true
end
