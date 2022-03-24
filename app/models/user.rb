class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  Roles = [ :admin , :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
end
