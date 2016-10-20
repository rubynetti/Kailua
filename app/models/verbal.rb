class Verbal < ApplicationRecord
  before_save do
    self.title = title.capitalize
    self.authors = authors.titleize
  end
  validates :title, presence: true
  validates :content, presence: true
  validates :authors, presence: true
end
