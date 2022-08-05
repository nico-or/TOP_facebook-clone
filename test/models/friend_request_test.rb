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

  test "can't sent inverse request" do
    req_1 = FriendRequest.create(
      sender: users(:one),
      receiver: users(:two)
    )

    req_2 = FriendRequest.new(
      sender: users(:two),
      receiver: users(:one)
    )

    refute req_2.valid?

    assert_no_changes 'FriendRequest.count' do
      req_2.save
    end
  end
end
