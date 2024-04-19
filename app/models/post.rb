class Post < ApplicationRecord
  belongs_to :user
  has_many :category_posts, dependent: :destroy
  has_many :categories, through: :category_posts
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :content, presence: true
  validates :user_id, presence: true
end
