class Article < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true, length: {minimum: 6, maximum: 80}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
end