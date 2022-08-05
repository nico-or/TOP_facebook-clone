require "test_helper"

class FriendRequestTest < ActiveSupport::TestCase
  test "creates user assocciations" do
    req = FriendRequest.create(
      sender: users(:one),
      receiver: users(:two))

    assert users(:one).sent_friend_requests.include? req
    assert users(:two).received_friend_requests.include? req
  end

  test "default status is pending" do
    request = FriendRequest.create(
      sender: users(:one),
      receiver: users(:two))

    assert_equal request.pending?, true
  end
end
