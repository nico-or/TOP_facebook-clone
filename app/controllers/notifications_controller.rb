class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end

  def read
    notifications = current_user.notifications.where(id: params[:id])

    if notifications.any?
      notification = notifications.first
      notification.read!
      redirect_to user_path(notification.notificable.sender)
    else
      redirect_to notifications_path
      flash[:alert] = "Can't find notification."
    end
  end
end
