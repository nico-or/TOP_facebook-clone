require "test_helper"
require 'digest/md5'

class GravatarHelperTest < ActionView::TestCase
  setup do
    @user = users(:one)
    @digest = Digest::MD5.hexdigest @user.email
  end

  test "produces correct url with no options hash" do
    target_url = "https://www.gravatar.com/avatar/#{@digest}?d=identicon"

    output = gravatar_image_url(@user)

    assert_equal output,target_url
  end

  test "produces correct url when given size option" do
    size = 80
    target_url = "https://www.gravatar.com/avatar/#{@digest}?d=identicon&s=#{size}"

    output = gravatar_image_url(@user, size: size)

    assert_equal output,target_url
  end

  test "produces correct image tag when no options hash is provided" do
    target_url = "https://www.gravatar.com/avatar/#{@digest}?d=identicon"
    target_tag = image_tag(target_url)

    output = gravatar_image_tag(@user)

    assert_equal output,target_tag
  end

  test "produces correct image tag when providing options hash" do
    gravatar_size = 80

    options = { size: '20x20', alt: 'profile picture',
      gravatar: { size: gravatar_size } }

    target_url = "https://www.gravatar.com/avatar/#{@digest}?d=identicon&s=#{gravatar_size}"

    target_tag = image_tag(target_url, options)

    output = gravatar_image_tag(@user, options)

    assert_equal output,target_tag
  end
end
