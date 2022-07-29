class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  before_action :new_post, only: %i[index new]

  def index
    @posts = Post.all.includes(:comments, :user)
  end

  def show
  end

  def new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = "Post successfully created"
    else
      flash[:alert] = @post.errors
    end

    redirect_back_or_to root_path
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
