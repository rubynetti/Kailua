class Socio < ApplicationRecord
  validates :number, uniqueness: true, presence: true
end
