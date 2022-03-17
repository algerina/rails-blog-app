class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  # private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  
  validates :name, presence: true, length: { maximum: 250 }
  validates :commentss_counter, presence: true, numericality: { only_integer: true }
  validates :likess_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }



end
