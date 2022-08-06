class FriendRequestsController < ApplicationController
  def create
    FriendRequest.create(
      sender: current_user,
      receiver: User.find(params[:user_id]))
  end

  def destroy
    FriendRequest.find(params[:id]).destroy
  end

  def accept
    FriendRequest.find(params[:id]).accepted!
  end
end
