require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  test "Notifications have a default state of :unread" do
    new_notification = Notification.new
    assert_equal 'unread', new_notification.status
  end
end
