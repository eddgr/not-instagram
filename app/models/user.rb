class User < ApplicationRecord
  attr_accessor :password
  before_save :encrypt_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  # validates email format to contain @

  # password requires confirmation
  validates :password, on: :create, confirmation: true
  # password requires confirmation on update
  validates :password, confirmation: true

  has_many :comments, dependent: :destroy
  has_many :posts, through: :comments
  has_many :posts, dependent: :destroy
  # destroys posts associated with user

  # active_relationships = following users
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  # source = method to be called

  # passive_relationships = being followed by other users
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # HELPER METHODS

  # FOLLOWING METHODS

  # follow
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # unfollow
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # is following user? For setting Follow button state
  def following?(other_user)
    following.include?(other_user)
  end

  # PASSWORD

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # AUTHENTICATION

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
