class Verbal < ApplicationRecord
  before_save do
    self.title = title.capitalize
    self.authors = authors.titleize
  end
  validates :title, presence: {message: ' non inserito'}
  validates :content, presence: {message: ' non inserito'}
  validates :authors, presence: {message: ' non inseriti'}
end
