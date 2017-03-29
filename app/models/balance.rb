class Balance < ApplicationRecord
  validates :name, presence: true

  def income
    Income.where(date_of_transaction: start_date...end_date)
  end

  def outcome
    Outcome.where(date_of_transaction: start_date...end_date)
  end

  def payoff
  	income.total - outcome.total
  end
end
