class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    @like.post_id = params[:post_id]
    if @like.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash[:error] = "Like could not be saved."
      render :new
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
