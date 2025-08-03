class Tag < ApplicationRecord
  has_many :taggings
  has_many :articles, through: :taggings

  # Garante que as tags sejam salvas em minúsculas e sem duplicatas
  before_save { self.name = name.downcase.strip }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
