class Income < ApplicationRecord
  monetize :price_cents
  validates :description, presence: true
  validates :price, presence: true
  validates :date_of_transaction, presence: true
  belongs_to :category, optional: true
  register_currency :eur

  include Csvable

  def self.default_scope
    order('date_of_transaction ASC')
  end
  
  # https://github.com/RubyMoney/money-rails/issues/140
  def self.total
    Money.new sum(:price_cents)
  end
end
