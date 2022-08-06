class FriendRequestsController < ApplicationController
  def create
    FriendRequest.create(
      sender: current_user,
      receiver: User.find(params[:user_id]))
  end
end
