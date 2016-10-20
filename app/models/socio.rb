class Socio < ApplicationRecord
  include InputFormatter

  validates :number, uniqueness: true, allow_blank: true

  before_save :nice_format
  #Formattazione attributi Socio
  def nice_format
    titleize_attributes :name, :surname, :birth_place, :residence_place
    self.cf.upcase!
    self.contact.downcase!
  end

  def completo?
    if number.blank? or name.blank? or surname.blank? or
      contact.blank? or complete == false or birthdate.blank? or residence_place.blank?
      return false
    end
    return true
  end

  def actions
    if registrato_con_modulo_cartaceo() == false
      return 'Da registrare con modulo cartaceo'
    elsif completo? == true
      return ''
    else
      return missing_fields
    end
  end

  def missing_fields
    s = '<ul>'
    s += "<li>nome" if name.blank?
    s += "<li>numero di tessera" if number.blank?
    s += "<li>cognome" if surname.blank?
    s += "<li>mail" if contact.blank?
    s += "<li>data di nascita" if birthdate.blank?
    s += "<li>luogo di nascita" if birth_place.blank?
    s += "</ul>"
    return s
  end

  def generic_status
    if registrato_con_modulo_cartaceo() == false or completo? == false
       return '<span class="glyphicon glyphicon-remove"></span>'
    else
      return '<span class="glyphicon glyphicon-ok"></span>'
    end
  end

  def registrato_con_modulo_cartaceo
    self.complete
  end

  def self.primo_numero_libero
    index = 500
    while Socio.exists?(number: index) do
      index +=1
    end

    return index

  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |socio|
        row = socio.attributes.values_at(*column_names)
        csv << row
      end
    end
end
end
