module SociosHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

  def last_socio(attribute = nil)
    last_socio = Socio.last
    return nil if !last_socio
    if attribute.in? [:number, :registration_date]
      return last_socio.send(attribute)
    end
  end

end
