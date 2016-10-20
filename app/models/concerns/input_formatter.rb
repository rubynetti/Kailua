module InputFormatter

  def titleize_attributes *to_titleize
    to_titleize.each do |a|
    self.send "#{a}=", send(a).titleize if self.has_attribute?(a)
    end
  end

end
