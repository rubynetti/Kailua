class Category < ApplicationRecord
  has_many :outcome
  has_many :income
end
