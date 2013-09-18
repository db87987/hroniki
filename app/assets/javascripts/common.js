$(document).ready(function() {
    $("#header_link").on('click', function () {
		$(location).attr('href', '/');
	});
	
	$(".hroniki_image_container").on("mouseover",function () {
		$(this).find('.hroniki_hover_container').show();
		$(this).find('.hroniki_hover_small_container').show();
	});
	

	$(".hroniki_image_container").mouseleave(function () {
		$('.hroniki_hover_container').hide();
		$('.hroniki_hover_small_container').hide();
	});
	
	$(".hroniki_image_container").mouseleave(function () {
		$('.hroniki_hover_container').hide();
		$('.hroniki_hover_small_container').hide();
	});
	
	
	$("#like").on('click', function () {
		$(this).addClass('active');
		$("#unlike").removeClass('active');
		$("#feedback_feedback_type").val('like');
		
		return false
	});
	
	$("#unlike").on('click', function () {
		$(this).addClass('active');
		$("#like").removeClass('active');
		$("#feedback_feedback_type").val('unlike');
		return false
	});
	
	$("#unlike").on('click', function () {
		$(this).addClass('active');
		$("#like").removeClass('active');
		$("#feedback_feedback_type").val('unlike');
		return false
	});
	
	$("#feedback_submit").on('click', function () {
		$("#new_feedback").submit();
	});
	
	
	$('#new_feedback').on('ajax:success', function(data, response, xhr) {
    if (response.status == 'ok') {
      scroll(0,0)
      $('#feedback_sent').show().fadeOut(4000);
	  $('#new_feedback_area').hide();
    }
  });
	
	
	
	
	
	
	

	
});