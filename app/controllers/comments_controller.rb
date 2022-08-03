class CommentsController < ApplicationController
  before_action :set_post, only: %i[create]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post

    if @comment.save
      redirect_back_or_to root_path, success: "Comment was successfully created"
    else
      redirect_back_or_to root_path, warning: "Comment could not be created"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
