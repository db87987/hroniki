$ ->
  slide_width = $(".slide").width()+4
  container = $(".slider2")
  slider_count = $(".slide").length
  $(container).width(slide_width*(slider_count+2))
  first_slide = $(".slide").first()
  last_slide = $(".slide").last()
  first_slide.clone().appendTo(container)
  last_slide.clone().prependTo(container)
  container.css {"left":"-="+slide_width+"px"}

  next_slide = () ->
    container.css {"left":"-="+slide_width+"px"}, ->
    new_left = $(container).position().left-(1*slide_width) 
    if new_left == ((slider_count+2)*(-1)*slide_width)
      container.css {"left": -1*slide_width+'px'}
  setInterval ->
    next_slide()
  , 6000

  $(".bck").click (e) ->
    e.preventDefault()
    next_slide()

  $(".fwd").click (e) ->
    e.preventDefault()
    container.css {"left":"+="+slide_width+"px"}, ->
    new_right = $(container).position().left
    console.log new_right
    if new_right == (0)
      container.css {"left": "-="+slide_width*slider_count+'px'}