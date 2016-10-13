class Verbal < ApplicationRecord
  validates :title, presence: {message: ' non inserito'}
  validates :content, presence: {message: ' non inserito'}
end
