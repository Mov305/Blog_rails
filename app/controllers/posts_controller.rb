class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
    @current = current_user

    respond_to do |format|
      format.html
      format.json { render json: @posts.to_json(include: :comments) }
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @user = current_user
    @current = current_user

    respond_to do |format|
      format.html
      format.json { render json: @post.to_json(include: :comments) }
    end
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

  def destroy
    @post = Post.find(params[:id])
    user_id = @post.user_id
    @post.destroy
    User.find(user_id).decrement!(:posts_counter)
    redirect_to user_posts_path(user_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
