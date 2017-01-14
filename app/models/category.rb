class Category < ApplicationRecord
  has_many :outcomes
  has_many :incomes
  def total
    self.incomes.total-self.outcomes.total
  end
end
