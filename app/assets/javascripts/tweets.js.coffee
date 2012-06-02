$ ->
  $(".tweet_click").click ->
    $(".cribber_block").css('background-color', 'white')
    $(this).parents('.cribber_block').css('background-color', 'lightgreen')
    urls = $(this).find('.cribber_text').text().match(/[^'"\w](https?:\/\/t.co\/\w+)/g)
    if urls
      for url in urls
        window.open url

