class Category < ApplicationRecord
  has_many :outcomes
  has_many :incomes
end
