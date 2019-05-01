class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # validats that both follower and followed is present to create relationship
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
