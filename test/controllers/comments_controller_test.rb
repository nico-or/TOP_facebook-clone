require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should create a comment" do
    post = posts(:one)

    comment_params = { body: 'foobar' }

    assert_difference 'Comment.count' do
      post post_comments_path(post), params: { comment: comment_params }
    end
  end
end
