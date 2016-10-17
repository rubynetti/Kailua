class Socio < ApplicationRecord

  validates :number, uniqueness: true, allow_blank: true

  before_save :nice_format

  #Formattazione attributi Socio
  def nice_format
    [self.name].each do |s|
        s = "CAZZO"
        self.name = s
    end
    self.contact.downcase!
  end


  def completo?
    if number.blank? or cf.blank? or name.blank? or surname.blank? or contact.blank? or complete == false or birthdate.blank? or residence_place.blank?
      return false
    end
    return true
  end

  def azioni
    if registrato_con_modulo_cartaceo() == false
      return 'Da registrare con modulo cartaceo'
    elsif completo? == true
      return ''
    else
      return cose_mancanti
    end
  end

  def cose_mancanti
    stringa = "Dati assenti: <ul>"
    stringa += "<li>numero di tessera" if number.blank?
    stringa += "<li>codice fiscale" if cf.blank?
    stringa += "<li>nome" if name.blank?
    stringa += "<li>cognome" if surname.blank?
    stringa += "<li>mail" if contact.blank?
    stringa += "<li>data di nascita" if birthdate.blank?
    stringa += "<li>luogo di nascita" if birth_place.blank?
    stringa += "</ul>"
    return stringa
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
