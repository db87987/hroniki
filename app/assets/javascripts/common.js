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


  $('#new_feedback').submit(function() {
    if ($("#feedback_name").val() == '' || $("#feedback_name").val() == 'Укажите ваше имя') {
      $("#feedback_name").addClass('input_error');
	  $("#feedback_name").val('Укажите ваше имя');
	  return false;
    }
    else if ($("#feedback_feedback").val() == '' || $("#feedback_feedback").val() == 'Оставьте отзыв') {
      $("#feedback_feedback").addClass('input_error');
	  $("#feedback_feedback").val('Оставьте отзыв');
	  return false;
    }
  });

  $("#feedback_name, #feedback_feedback").focus(function() {
	if ($(this).val() == 'Укажите ваше имя' || $(this).val() == 'Оставьте отзыв') {
      $(this).val('');
	  $(this).removeClass('input_error');	
    }
  });

  $(".show_feedback_form").on('click', function () {
    $(".wrap").slideToggle();
	return false
  });

	$("#event_date").datepicker({
		dateFormat: 'dd.mm.yy'
	});


   // event by user
  
	$("#feedback_submit").on('click', function () {
		$("#new_event").submit();
	});
	
	$('#new_event :input').focus(function() {
	  $(this).removeClass('input_error');	
    });
 
	$('#new_event').submit(function() {
		inputs = $('#new_event :input')	
		inputs.each(function() {
			if ($(this).val() == '') {
		      $(this).addClass('input_error');	
		    }   
	    });
	});
	
	$('#new_event').on('ajax:success', function(data, response, xhr) {
    if (response.status == 'ok') {
	  $(".wrap").hide();
      $('#event_sent').show().fadeOut(4000);
    }
    else{
	  Recaptcha.reload();
      $('#event_errors').html(response.errors.join('<br>'));
    }
    });
	

	

  
 	
	
	
	
	

	
});