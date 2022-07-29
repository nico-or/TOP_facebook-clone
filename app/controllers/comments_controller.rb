class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment successfully created"
    else
      flash[:alert] = @comment.errors
    end

    redirect_back_or_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
