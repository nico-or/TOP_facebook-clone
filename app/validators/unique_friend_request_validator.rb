class UniqueFriendRequestValidator < ActiveModel::Validator
  def validate(request)
    if request_already_exists(request)
      request.errors.add(:base, "An identical request already exists")
    end
  end

  private

    def request_already_exists(request)
      FriendRequest.find_by(
        sender_id: request.sender_id,
        receiver_id: request.receiver_id)
    end
end
