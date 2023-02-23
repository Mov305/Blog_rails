class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :comment_increments

  private

  def comment_increments
    post.increment!(:comments_counter)
  end
end
