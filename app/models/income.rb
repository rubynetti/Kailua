class Income < ApplicationRecord
  monetize :price_cents
  validates :description, presence: true
  validates :price, presence: true
  validates :date_of_transaction, presence: true
  register_currency :eur
  def self.total
    sum(:price_cents)
  end
end
