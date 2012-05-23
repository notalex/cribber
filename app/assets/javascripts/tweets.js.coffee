$ ->
  $(".cribber_block").click ->
    $(".cribber_block").css('background-color', 'white')
    $(this).css('background-color', 'lightgreen')
    url = $(this).find('.cribber_text').text().match(/\bhttp:\/\/t.co\/\w+(\s|$)/)
    window.open url[0] if url

