class UsersController < ApplicationController
  def index
    @Users = User.all
  end

  def show
    @User = User.find(params[:id])
  end
end
