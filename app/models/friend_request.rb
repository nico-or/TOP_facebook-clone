class FriendRequest < ApplicationRecord
  include ActiveModel::Validations
  validates_with SingleFriendRequestValidator

  belongs_to :sender, class_name: :User
  belongs_to :receiver, class_name: :User

  enum :status, [:pending, :accepted, :rejected]
end
