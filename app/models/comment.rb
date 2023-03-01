class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  before_save :set_username
  after_save :comment_increments

  private

  def set_username
    self.username = user.name
  end

  def comment_increments
    post.increment!(:comments_counter)
  end
end
