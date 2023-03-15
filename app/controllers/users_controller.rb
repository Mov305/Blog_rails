class UsersController < ApplicationController
  def index
    @users = User.all
    @current = current_user

    respond_to do |format|
      format.html
      format.json { render json: @users.to_json(include: :posts) }
    end
  end

  def show
    @user = User.find(params[:id])
    @latest = @user.return_recent_posts
    @current = current_user

    respond_to do |format|
      format.html
      format.json { render json: @user.to_json(include: :posts) }
    end
  end
end
