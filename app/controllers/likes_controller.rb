class LikesController < ApplicationController
  def create
    @like = Like.new()
    @like.user_id = current_user.id
    @like.post_id = params[:post_id]
    # catch the error if the like could not be saved
    if @like.valid?
      @like.save
      redirect_to user_post_path(current_user.id, params[:post_id])
    else
      flash[:alert] = "You have already liked this post"
      redirect_to user_post_path(current_user.id, params[:post_id])
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to user_post_path(current_user.id, params[:post_id])
  end
end
