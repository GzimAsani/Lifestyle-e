class Article < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :vote, foreign_key: 'article_id', dependent: :destroy
  has_one_attached :image
  
  validates_presence_of :image
  validates :title, presence: true, length: {minimum: 6, maximum: 80}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
end