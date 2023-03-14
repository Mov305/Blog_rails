class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(current_user.id, params[:post_id])
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    user_id = @comment.user_id
    post_id = @comment.post_id
    @comment.destroy
    Post.find(post_id).decrement!(:comments_counter)
    redirect_to user_post_path(user_id, post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
