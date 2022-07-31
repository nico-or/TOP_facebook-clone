class LikesController < ApplicationController
  def create
    @like = current_user.likes.build
    @like.post_id = like_params[:post_id]
    @like.save

    # if @like.save
    #   flash[:success] = "Like was successfully created"
    # else
    #   flash[:danger] = "Like could not be created"
    # end

    redirect_back_or_to root_path
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy

    # if @like.destroy
    #   flash[:success] = "Like was successfully deleted"
    # else
    #   flash[:danger] = "Like could not be deleted"
    # end

    redirect_back_or_to root_path
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
