require "test_helper"

class FriendRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should create a FriendRequest" do
    assert_difference("FriendRequest.count") do
      post user_friend_requests_url(users(:three))
    end
  end

  test "should destroy a FriendRequest" do
    request = friend_requests(:one)

    assert_difference("FriendRequest.count", -1) do
      delete friend_request_url(request)
    end
  end
end