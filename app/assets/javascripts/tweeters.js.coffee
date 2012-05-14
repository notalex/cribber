$ ->
  $(".cribber_block").click ->
    $(".cribber_block").removeClass('cribber_selected')
    $(this).addClass('cribber_selected')
    url = $(this).find('.cribber_text').text().match(/\bhttp:\/\/t.co\/\w+(\s|$)/)
    window.open url[0] if url
