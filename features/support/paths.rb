def path_to(page)
  case page

  when /home page/
    visit '/'
  else
    url = page.downcase.split(' ').join('_')
    visit eval("#{url}_path")
  end

end

