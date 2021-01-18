class User < ApplicationRecord
  validates :username, presence: true, length: {minimum: 4, maximum: 24}, uniqueness: { case_sensitive: false }
  has_many :articles, foreign_key: :author_id
end