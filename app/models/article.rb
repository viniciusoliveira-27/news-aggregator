class Article < ApplicationRecord
  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  # ... validações ...
  validates :title, :url, :user_id, presence: true
end
