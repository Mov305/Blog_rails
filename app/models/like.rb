class Like < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id

  # primary key is a combination of user_id and post_id
  after_save :like_increments

  private

  def like_increments
    post.increment!(:likes_counter)
  end
end
