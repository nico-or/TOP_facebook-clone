class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_back_or_to root_path, success: "Comment was successfully created"
    else
      redirect_back_or_to root_path, warning: "Comment could not be created"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
