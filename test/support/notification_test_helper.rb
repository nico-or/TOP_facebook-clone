def new_notification
  request = FriendRequest.create(
    sender: users(:one),
    receiver: users(:two)
  )

  notification = Notification.new(
    user: users(:two),
    notificable: request
  )
end
