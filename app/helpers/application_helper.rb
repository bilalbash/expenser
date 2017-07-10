module ApplicationHelper
  def icon_with(name, tag, help_text='')
    tag = tag.blank? ? '' : tag
    open_tag = tag.blank? ? '' : "<#{tag}>"
    close_tag = tag.blank? ? '' : "</#{tag}>"

    case name
      when :about then "<i class='pe-7s-add-user'></i>#{open_tag}About#{close_tag}".html_safe
      when :sign_up then "<i class='pe-7s-add-user'></i>#{open_tag}Sign up#{close_tag}".html_safe
      when :sign_in then "<i class='pe-7s-right-arrow'></i>#{open_tag}Sign in#{close_tag}".html_safe
      when :sign_out then "<i class='pe-7s-power'></i>#{open_tag}Sign out#{close_tag}".html_safe
      when :edit_account then "<i class='pe-7s-pen'></i>#{open_tag}Edit Account#{close_tag}".html_safe
      when :categories then "<i class='pe-7s-notebook'></i>#{open_tag}Categories#{close_tag}".html_safe
      when :items then "<i class='pe-7s-note2'></i>#{open_tag}Items#{close_tag}".html_safe
      when :add then "<i class='i-test-css pe-7s-plus'></i>#{open_tag + help_text + close_tag}".html_safe
      when :edit then "<i class='i-test-css pe-7s-note'></i>#{open_tag + help_text + close_tag}".html_safe
      when :destroy then "<i class='i-test-css pe-7s-less'></i>#{open_tag + help_text + close_tag}".html_safe
      when :list then "<i class='i-test-css pe-7s-news-paper'></i>#{open_tag + help_text + close_tag}".html_safe
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
