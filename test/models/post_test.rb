require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
  end

  test "invalid without a body" do
    @post.body = nil
    refute @post.valid?
  end

  test "access the post author" do
    assert_respond_to @post, :user
    assert_equal @post.user, users(:one)
  end

  test "access the post like count" do
    assert_equal @post.likes.count, 1
  end

  test "access the post liking users" do
    assert_equal @post.liking_users.count, 1
    assert_includes @post.liking_users, users(:one)
  end

  test "deletes likes when destroyed" do
    assert_changes('Like.count', 'A like should be destroyed') do
      @post.destroy
    end
  end

  test "deletes comments when destroyed" do
    assert_changes('Comment.count', 'A post should be destroyed') do
      @post.destroy
    end
  end

  test "doesn't delete author when destroyed" do
    assert_no_difference('User.count', 'A user was destroyed') do
      @post.destroy
    end
  end
end
