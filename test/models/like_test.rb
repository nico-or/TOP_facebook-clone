require "test_helper"

class LikeTest < ActiveSupport::TestCase
  setup do
    @like = likes(:one)
  end

  test "invalid without post_id" do
    @like.post_id = nil
    refute @like.valid?
  end

  test "invalid without user_id" do
    @like.user_id = nil
    refute @like.valid?
  end

  test "gets deleted when post is destroyed" do
    assert_changes("Like.count", 'A like should be destroyed') do
      @like.post.destroy
    end
  end

  test "gets deleted when users is destroyed" do
    assert_changes("Like.count", 'A like should be destroyed') do
      @like.user.destroy
    end
  end
end
