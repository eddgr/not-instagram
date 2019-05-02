class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  validates :title, presence: true
  validates :user_id, presence: true
  has_one_attached :photo
  validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
  # uses active_storage_validations gem
end
