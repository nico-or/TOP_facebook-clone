require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "mark a notification as read" do
    request = FriendRequest.create(sender: users(:two), receiver: users(:one))
    notification = request.notifications.first

    get read_notification_path(notification)

    notification = request.notifications.first
    assert notification.read?

    assert_redirected_to user_path(notification.notificable.sender)
  end

  test "can't mark other users notifications as read" do
    request = FriendRequest.create(sender: users(:two), receiver: users(:three))
    notification = request.notifications.first

    get read_notification_path(notification)

    notification = request.notifications.first
    refute notification.read?

    assert_redirected_to notifications_path
  end
end
