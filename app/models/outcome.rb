class Outcome < ApplicationRecord
  monetize :price_cents
  validates :description, presence: true
  validates :price, presence: true
  validates :date_of_transaction, presence: true
  register_currency :eur

  def self.default_scope
    order('date_of_transaction ASC')
  end
  def self.total
    sum(:price_cents)
  end
end
