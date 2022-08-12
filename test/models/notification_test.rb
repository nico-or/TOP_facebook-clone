require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  setup do
    request = FriendRequest.create(
      sender: users(:one),
      receiver: users(:two)
    )

    @notification = Notification.new(
      user: users(:two),
      notificable: request
    )
  end

  test "Notifications have a default state of :unread" do
    new_notification = Notification.new
    assert_equal 'unread', new_notification.status
  end

  test "Can't create without user" do
    assert @notification.valid?

    @notification.user = nil

    refute @notification.valid?
  end

  test "Can't create without notificable" do
    assert @notification.valid?

    @notification.notificable = nil

    refute @notification.valid?
  end
end
