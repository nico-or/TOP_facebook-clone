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
end
