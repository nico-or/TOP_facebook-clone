class SingleFriendRequestValidator < ActiveModel::Validator
  def validate(request)
    if reverse_request_already_exists(request)
      request.errors.add(:base, "A inverse friend request is already pending")
    end
  end

  private

    def reverse_request_already_exists(request)
      FriendRequest.find_by(
        sender_id: request.receiver_id,
        receiver_id: request.sender_id)
    end
end
