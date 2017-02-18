class Contact < ApplicationRecord
  validates :name, :surname, :contact, presence: true
end
