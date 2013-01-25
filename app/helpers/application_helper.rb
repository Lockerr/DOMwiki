module ApplicationHelper
  def stars(number)
    result = ''
    number.times do
      result += content_tag(:span, content_tag(:i, '', class: 'icon-star'), class: :star, style: 'margin-left: 3px')
      
    end
    (5-number).times do
      result +=content_tag(:span, content_tag(:i, '', class: 'icon-star-empty'), class: :star, style: 'margin-left: 3px')
      
    end
    result.html_safe
  end
end

