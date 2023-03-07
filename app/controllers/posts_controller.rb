class PostsController < ApplicationController
  def index
    @posts = current_user.return_recent_posts.includes(:user, :comments)
    @user = User.find(params[:user_id])
    @current = current_user
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
    @user = current_user
    @current = current_user
  end

  def new
    @post = Post.new
    @current = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
