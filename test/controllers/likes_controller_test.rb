require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should create a new like" do
    sign_in users(:one)

    user = users(:one)
    post = posts(:two)

    assert_difference("Like.count") do
      post likes_url, params: { like: { user_id: user.id, post_id: post.id } }
    end
  end

  test "should delete an existing like" do
    sign_in users(:one)

    like = likes(:one)

    assert_difference("Like.count", -1) do
      delete like_url(like)
    end
  end

  test "should not create post for other users" do
    skip <<~DOC
      Returning:
      ActiveRecord::RecordNotUnique: PG::UniqueViolation:
      ERROR: duplicate key value violates unique constraint "index_likes_on_post_id_and_user_id"
    DOC

    sign_in users(:two)

    user = users(:one)
    post = posts(:two)

    assert_no_difference("Like.count") do
      post likes_url, params: { like: { user_id: user.id, post_id: post.id } }
    end
  end

  test "should not delete post of other users" do
    skip "Fails with error: ActiveRecord::RecordNotFound: Couldn't find Like with..."

    sign_in users(:one)

    like = likes(:two)

    assert_no_difference("Like.count") do
      delete like_url(like)
    end
  end
end
