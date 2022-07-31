require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)

    sign_in(@user)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get show" do
    get post_url(@post)
    assert_response :success
  end
end
