class Article < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :article_categories
  has_many :categories, through: :article_categories
end