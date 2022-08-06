require "test_helper"

class FriendRequestTest < ActiveSupport::TestCase
  setup do
    @request = FriendRequest.create(
      sender: users(:one),
      receiver: users(:two))
  end

  test "creates user assocciations" do
    assert users(:one).sent_friend_requests.include? @request
    assert users(:two).received_friend_requests.include? @request
  end

  test "default status is pending" do
    assert_equal @request.pending?, true
  end

  test "can't sent inverse request" do
    reverse_request = FriendRequest.new(
      sender: users(:two),
      receiver: users(:one)
    )

    refute reverse_request.valid?

    assert_no_changes 'FriendRequest.count' do
      reverse_request.save
    end
  end
end
