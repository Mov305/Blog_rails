class Api::V1::CommentsController < ApplicationController
  before_action :set_post, only: %i[create]
  before_action :set_comment, only: %i[update destroy]
  skip_before_action :verify_authenticity_token


  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.permit(:text)
  end
end
