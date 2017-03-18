class Socio < ApplicationRecord

  validates :number, uniqueness: true, allow_blank: true

  before_save :nice_format

  def nice_format
    titleize_attributes :name, :surname, :birth_place, :residence_place
    self.cf.upcase!
    self.contact.downcase!
  end

  def full_fields?
    if number.blank? or name.blank? or surname.blank? or
      contact.blank? or complete == false or birthdate.blank? or residence_place.blank?
      return false
    end
    return true
  end

  def actions
    if paperwork_filed() == false
      return 'Da registrare con modulo cartaceo'
    elsif full_fields? == true
      return ''
    else
      return missing_fields
    end
  end

  def missing_fields
    s = '<ul>'
    s += "<li>#{Socio.human_attribute_name :name}" if name.blank?
    s += "<li>#{Socio.human_attribute_name :surname}" if surname.blank?
    s += "<li>#{Socio.human_attribute_name :number}" if number.blank?
    s += "<li>#{Socio.human_attribute_name :contact}" if contact.blank?
    s += "<li>#{Socio.human_attribute_name :birth_place}" if birth_place.blank?
    s += "<li>#{Socio.human_attribute_name :birthdate}" if birthdate.blank?
    s += "</ul>"
    return s
  end

  def generic_status
    if paperwork_filed() == false or full_fields? == false
       return '<span class="glyphicon glyphicon-remove"></span>'
    else
      return '<span class="glyphicon glyphicon-ok"></span>'
    end
  end

  def paperwork_filed
    self.complete
  end

  def self.primo_numero_libero
    index = 500
    while Socio.exists?(number: index) do
      index +=1
    end
    return index
  end

  def titleize_attributes *to_titleize
    to_titleize.each do |a|
    self.send "#{a}=", send(a).titleize if self.has_attribute?(a)
    end
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
