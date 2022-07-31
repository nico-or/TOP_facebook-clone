require "test_helper"

class HomepageTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in(@user)
    get '/'
  end

  test "sign out button" do
    assert_select 'nav button', 'Sign Out'
  end

  test "navigation links" do
    assert_select 'nav .nav-item', 'Users'
    assert_select 'nav .nav-item', 'Profile'
  end
end
