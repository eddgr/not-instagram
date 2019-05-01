class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  validates :title, presence: true
  validates :user_id, presence: true
  has_one_attached :photo
end
