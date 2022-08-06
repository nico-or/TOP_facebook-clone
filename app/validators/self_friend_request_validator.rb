class SelfFriendRequestValidator < ActiveModel::Validator
  def validate(request)
    if condition(request)
      request.errors.add(:base, "Can't send requests to yourself")
    end
  end

  private

  def condition(request)
    request.sender_id == request.receiver_id
  end
end
