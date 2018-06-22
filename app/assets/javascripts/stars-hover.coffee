toggle_stars =(el, max_num) ->
  el.closest('div').find('i').each ->
    num = parseInt($(this).attr('value'))
    if num <= max_num && $(this).hasClass('fa-star-o')
      $(this).toggleClass('fa-star-o fa-star')
    else if num > max_num && $(this).hasClass('fa-star')
      $(this).toggleClass('fa-star fa-star-o')

jQuery ->
  $(document).on {
    mouseover: ->
      max_num = parseInt($(this).attr('value'))
      toggle_stars($(this), max_num)
    mouseleave: ->
      max_num = $(this).closest('div').attr('value')
      toggle_stars($(this), max_num)
  }, '.rate_it_star'
