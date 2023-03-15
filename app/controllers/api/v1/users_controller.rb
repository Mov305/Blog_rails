class Api::V1::UsersController < ApplicationController
  # GET /api/v1/users => to get all users
  def index
    @users = User.all
    render json: @users
  end

  # GET /api/v1/users/:id => to get a specific user

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(include: :posts)
  end
end
