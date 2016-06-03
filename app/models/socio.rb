class Socio < ApplicationRecord
  validates :number, uniqueness: true, allow_blank: true
  def completo?
    if number.blank? or cf.blank? or name.blank? or surname.blank? or contact.blank? or complete == false or birthdate.blank?
      return false 
    end
    return true
  end
end
