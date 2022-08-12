class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :sent_friend_requests,
           class_name: :FriendRequest,
           foreign_key: :sender_id,
           dependent: :destroy

  has_many :received_friend_requests,
           class_name: :FriendRequest,
           foreign_key: :receiver_id,
           dependent: :destroy

  has_many :notifications, dependent: :destroy

  def friends
    out = []
    out += sent_friend_requests.accepted.map(&:receiver)
    out += received_friend_requests.accepted.map(&:sender)
    out
  end

  def visible_users
    friends << self
  end
end
