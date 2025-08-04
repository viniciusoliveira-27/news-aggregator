class Tag < ApplicationRecord
  has_many :taggings
  has_many :articles, through: :taggings

  before_save { self.name = name.downcase.strip }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
