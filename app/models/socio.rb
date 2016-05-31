class Socio < ApplicationRecord
  validates :number, uniqueness: true, allow_blank: true
end
