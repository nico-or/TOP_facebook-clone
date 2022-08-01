require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "invalid without email" do
    @user.email = nil
    refute @user.valid?
  end

  test "access the user posts" do
    assert_respond_to @user, :posts
    assert_equal @user.posts.size, 2
    assert_includes @user.posts, posts(:one)
    assert_includes @user.posts, posts(:three)
    refute_includes @user.posts, posts(:two)
  end

  test "deletes likes when destroyed" do
    assert_changes('Like.count', 'A like should be destroyed') do
      @user.destroy
    end
  end

  test "deletes posts when destroyed" do
    assert_changes('Post.count', 'A post should be destroyed') do
      @user.destroy
    end
  end

  test "deletes comments when destroyed" do
    assert_changes('Comment.count', 'A comment should be destroyed') do
      @user.destroy
    end
  end
end
