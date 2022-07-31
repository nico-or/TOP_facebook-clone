require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test "Viewing the user profile" do
    skip
    get users_url(@user)
    assert_response :success

    assert_select 'email', @user.email
  end
end
