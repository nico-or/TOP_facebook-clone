class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  before_action :new_post, only: %i[index new]

  def index
    @posts = Post.where(user: current_user.visible_users)
                 .includes(:comments, :user, :likes)
                 .newest_first
                 .page(params[:page])
                 .per(12)
  end

  def show
  end

  def new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_back_or_to root_path, success: "Post was successfully created"
    else
      redirect_back_or_to root_path, danger: "Post could not be created"
    end

  end

  private

  def new_post
    @post = Post.new
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
