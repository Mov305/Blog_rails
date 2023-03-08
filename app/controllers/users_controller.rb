class UsersController < ApplicationController
  def index
    @users = User.all
    @current = current_user
  end

  def show
    @user = User.find(params[:id])
    @latest = @user.return_recent_posts
    @current = current_user
  end
end
