$ ->
  $(".cribber_block").first().addClass('selected_tweet')

  $(".cribber_block").click ->
    $(".cribber_block").removeClass('selected_tweet')
    $(this).addClass('selected_tweet')

  $('.open_links').click ->
    parent = $(this).parents('.cribber_block')
    open_urls_for parent

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
    text = $(this).val()
    text = text.replace /((https?:\/\/|www\.)[^\s]+)/g, "twenty_one_characters"
    $('#post_tweet b').html(140 - text.length)

  # check and stop tweet post on submit
  $("#tweet_post").submit ->
    tweet_length = Number $("#post_tweet b").text()
    if tweet_length >= 0
      true
    else
      false

  $('.cribber_block').mouseenter ->
    $(this).find('.tweet_actions').show()

  $('.cribber_block').mouseleave ->
    $(this).find('.tweet_actions').hide()

  # for keyboard navigation using arrow keys
  if $(".cribber_block").present()
    $(window).keyup (e) ->
      if $(".cribber_block").hasClass("selected_tweet")
        id = Number $(".selected_tweet").attr('id').match(/\d+/)
        element = switch e.keyCode
          when code_for('right')
            $("#selection_#{id + 1}")
          when code_for('left')
            $("#selection_#{id - 1}")
          when code_for('up')
            $("#selection_#{id - 2}")
          when code_for('down')
            $("#selection_#{id + 2}")
          when code_for('enter')
            open_urls_for $("#selection_#{id}")
            false
        if element.present()
          $(".cribber_block").removeClass('selected_tweet')
          element.addClass('selected_tweet')

window.open_urls_for = (element) ->
  urls = element.find('.cribber_text').text().match(/[^'"\w](https?:\/\/t.co\/\w+)/g)
  if urls
    for url in urls
      window.open url
