require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get show" do
    get user_url(@user)
    assert_response :success
  end

  test "should get /profile" do
    get '/profile'
    assert_response :success
  end

  test "should patch/update" do
    new_description = 'lorem ipsum'
    user_params = { description: new_description }

    patch user_path(@user), params: { user: user_params }

    assert_redirected_to @user

    @user.reload

    assert_equal new_description, @user.description
  end
end
