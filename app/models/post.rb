class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :post_increments

  def return_recent_comments
    comments.order('created_at DESC').limit(5)
  end

  private

  def post_increments
    user.increment!(:posts_counter)
  end
end
