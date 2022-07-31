require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should create a like" do
    post = posts(:two)

    assert_difference("Like.count") do
      post likes_url, params: { like:
          { user_id: @user.id, post_id: post.id } }
    end
  end

  test "should destroy like" do
    like = likes(:one)

    assert_difference("Like.count", -1) do
      delete like_url(like)
    end
  end
end
