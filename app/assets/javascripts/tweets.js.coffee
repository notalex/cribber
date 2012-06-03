$ ->
  $(".cribber_block").click ->
    $(".cribber_block").removeClass('selected_tweet')
    $(this).addClass('selected_tweet')

  $('.open_links').click ->
    parent = $(this).parents('.cribber_block')
    urls = parent.find('.cribber_text').text().match(/[^'"\w](https?:\/\/t.co\/\w+)/g)
    if urls
      for url in urls
        window.open url

  # hide icon when tweet field is in focus and show count instead
  $("#send_tweet").focus ->
    $(this).css('width', '450px')
    $('#post_tweet i').hide()
    $('#post_tweet b').show()

  # show icon when tweet field is exited
  $('#send_tweet').blur ->
    $('#post_tweet b').hide()
    $('#post_tweet i').show()
    $(this).css('width', '250px') if empty( $(this) )

  # increment counter with val length of tweet field
  $('#send_tweet').keyup ->
    $('#post_tweet b').html(140 - $(this).val().length)

  $('.cribber_block').mouseenter ->
    $(this).find('.tweet_actions').show()

  $('.cribber_block').mouseleave ->
    $(this).find('.tweet_actions').hide()
