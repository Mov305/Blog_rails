class Api::V1::PostsController < ApplicationController
  # GET /api/v1/users/:user_id/posts => to get all posts of a specific user
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
    render json: @posts.to_json(include: :comments)
  end

  # GET /api/v1/users/:user_id/posts/:id => to get a specific post of a specific user
  def show
    @post = Post.find(params[:id])
    render json: @post.to_json(include: :comments)
  end
end
