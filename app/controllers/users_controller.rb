class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def index
    @users = User.all
  end

  def show
  end

  def profile
    @user = current_user
    render :show
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description)
  end
end
