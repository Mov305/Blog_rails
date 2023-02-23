class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: 'user'
  has_many :likes, dependent: :destroy, foreign_key: 'user'
  has_many :comments, dependent: :destroy, foreign_key: 'user'

  def return_recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
