require 'test_helper'

class DescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test "should get edit" do
    get edit_description_path
    assert_response :success
  end
end
