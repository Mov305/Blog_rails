class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :post_increments

  def return_recent_comments
    comments.order('created_at DESC').limit(5)
  end

  def as_json(options = {})
    super({ only: %i[id title body created_at updated_at comments_counter likes_counter] }.merge(options))
  end

  private

  def post_increments
    user.increment!(:posts_counter)
  end
end
