class FriendRequestsController < ApplicationController
  def create
    FriendRequest.create(
      sender: current_user,
      receiver: User.find(params[:user_id]))

    redirect_back_or_to root_path
  end

  def destroy
    FriendRequest.find(params[:id]).destroy

    redirect_back_or_to root_path
  end

  def accept
    FriendRequest.find(params[:id]).accepted!

    redirect_to user_path(FriendRequest.find(params[:id]).receiver)
  end
end
