class FriendRequest < ApplicationRecord
  include ActiveModel::Validations

  # on: create is necessary or an :status update (id: request.accepted!) will fail with:
  #   ActiveRecord::RecordInvalid: Validation failed: A identical request already exists
  validates_with UniqueFriendRequestValidator, on: :create
  validates_with SingleFriendRequestValidator

  belongs_to :sender, class_name: :User
  belongs_to :receiver, class_name: :User

  enum :status, [:pending, :accepted, :rejected]
end
