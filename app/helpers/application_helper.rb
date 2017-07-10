module ApplicationHelper
  def icon_with(name)
    tag = 'span'
    open_tag = tag.blank? ? '' : "<#{tag}>"
    close_tag = tag.blank? ? '' : "</#{tag}>"
    case name
      when :about then "#{open_tag}About#{close_tag}".html_safe
      when :sign_up then "<i class='pe-7s-add-user'></i>#{open_tag}Sign up#{close_tag}".html_safe
      when :sign_in then "<i class='pe-7s-right-arrow'></i>#{open_tag}Sign in#{close_tag}".html_safe
      when 1930..1939 then 'Swing'
      when 1940..1950 then 'Bebop'
      else 'Jazz'
    end
  end

  def week_number(day)
    case day
      when day < 8 then 1
      when day < 15 then 2
      when day < 22 then 3
      when day < 29 then 4
      else 5
    end
  end

end
