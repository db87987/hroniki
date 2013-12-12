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
	
	$("#subscription_submit").on('click', function () {
		$(".new_subscription").submit();
		Recaptcha.reload();
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

  $("#subscribe_form").on('click', function () {
    $("#subscribe_wrap").toggle();
		$("#feedback_wrap").hide();
		$("#feedback_form").addClass('not_active');
		$("#subscribe_form").removeClass('not_active');
		return false
  });

  $("#feedback_form").on('click', function () {
    $("#feedback_wrap").toggle();
		$("#subscribe_wrap").hide();
		$("#subscribe_form").addClass('not_active');
		$("#feedback_form").removeClass('not_active');
		return false
  });

	$("#event_date").datepicker({
		dateFormat: 'dd.mm.yy'
	});


   // event by user
  
	$("#feedback_submit").on('click', function () {
		$("#new_event").submit();
	});
	
	$('#new_event :input, .new_subscription :input').focus(function() {
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
	
	$('.new_subscription').submit(function() {
		inputs = $('.new_subscription :input')	
		inputs.each(function() {
			if ($(this).val() == '') {
		      $(this).addClass('input_error');	
		    }   
	    });
	});
	
	// $('.new_subscription').on('ajax:success', function(data, response, xhr) {
	//     if (response.status == 'ok') {
	// 	scroll(0,0)
	// 	$(".wrap").hide();
	// 	$('#subscribtion_create').show().fadeOut(4000);
	//     }
	//     else{
	//   Recaptcha.reload();
	//       $('#event_errors').html(response.errors.join('<br>'));
	//     }
	//     });


  
 	
	
	
	
	

	
});