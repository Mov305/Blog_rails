class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :like_increments

  private

  def like_increments
    post.increment!(:likes_counter)
  end
end
