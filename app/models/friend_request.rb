class FriendRequest < ApplicationRecord
  include ActiveModel::Validations

  # on: create is necessary or an :status update (id: request.accepted!) will fail with:
  #   ActiveRecord::RecordInvalid: Validation failed: A identical request already exists
  validates_with UniqueFriendRequestValidator, on: :create
  validates_with SingleFriendRequestValidator
  validates_with SelfFriendRequestValidator

  belongs_to :sender, class_name: :User
  belongs_to :receiver, class_name: :User

  has_many :notifications, as: :notificable

  enum :status, [:pending, :accepted, :rejected]

  after_create :create_notification

  def self.find_between(user_1, user_2)
    FriendRequest.find_by(sender: user_1, receiver: user_2) ||
    FriendRequest.find_by(sender: user_2, receiver: user_1)
  end

  private

  def create_notification
    self.notifications.create(user: receiver)
  end
end
