$ ->
  slide_width = $(".slider ul li").width()
  container = $(".slider ul")
  slider_count = $(".slider ul li").length
  $(container).width(slide_width*(slider_count+2))
  first_slide = $(".slider ul li").first()
  last_slide = $(".slider ul li").last()
  first_slide.clone().appendTo(container)
  last_slide.clone().prependTo(container)
  container.css {"left":"-="+slide_width+"px"}
  in_progress = false

  $(".fwd").click ->
    if not in_progress
      in_progress = true
      container.animate {"left":"-="+slide_width+"px"}, 600, ->
        new_left = $(container).position().left-(1*slide_width)
        if new_left == ((slider_count+2)*(-1)*slide_width)
          container.css {"left": -1*slide_width+'px'}
        in_progress = false

  $(".bck").click ->
    if not in_progress
      in_progress = true
      container.animate {"left":"+="+slide_width+"px"}, 600, ->
        new_right = $(container).position().left
        if new_right == (0)
          container.css {"left": "-="+slide_width*slider_count+'px'}
        in_progress = false