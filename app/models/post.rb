class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter
  after_destroy :update_posts_counter

  # private

  def update_posts_counter
    author.update(posts_counter: author.posts.length)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
