module InputFormatter

  def titleize_attributes *to_titleize
    to_titleize.map! &:to_s
    (attribute_names & to_titleize).each do |a|
      send "#{a}=", send(a).titleize
    end
  end

end
