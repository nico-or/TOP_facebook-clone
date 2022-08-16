require "test_helper"
require "support/notification_test_helper"

class NotificationTest < ActiveSupport::TestCase
  test "Notifications have a default state of :unread" do
    new_notification = Notification.new
    assert_equal 'unread', new_notification.status
  end

  test "Can't create without user" do
    notification = new_notification

    notification.user = nil

    refute notification.valid?
  end

  test "Can't create without notificable" do
    notification = new_notification

    notification.notificable = nil

    refute notification.valid?
  end

  test "Creating a new FriendRequest sends a Notification to the receiver" do
    assert_difference "Notification.count", 1 do
      assert_difference "users(:two).notifications.count", 1 do
        assert_no_difference "users(:one).notifications.count" do
          FriendRequest.create(sender: users(:one), receiver: users(:two))
        end
      end
    end

    assert_equal users(:two), Notification.last.user
  end

  test "Destroys Notifications after destroying the notificable" do
    request = FriendRequest.create(sender: users(:one), receiver: users(:two))

    assert_difference "Notification.count", -1 do
      request.destroy
    end
  end

  test "Destroys Notifications after destroying the user" do
    user = users(:two)
    FriendRequest.create(sender: users(:one), receiver: user)

    assert_difference "Notification.count", -1 do
      user.destroy
    end
  end
end
