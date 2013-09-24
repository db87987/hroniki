$(document).ready(function() {
	
	$("#suggest_hronik").on('click', function () {
		$(".wrapper, .footer").addClass("blur");
		$("#modal").show();
	});
	
	$(".close_modal").on('click', function () {
		$(".wrapper, .footer").removeClass("blur");
		$("#modal").hide();
	});
	

	
	var wrapper = $('<div/>').css({height:0,width:0,'overflow':'hidden'});
	var fileInput = $(':file').wrap(wrapper);

	fileInput.change(function(){
	    $this = $(this);
	    $('#file').text($this.val());
	})

	$('#file').click(function(){
	    fileInput.click();
	}).show();
	
	$("#suggest_submit").on('click', function () {
		$("#new_suggest").submit();
	});
	
	$('#new_suggest').on('ajax:success', function(data, response, xhr) {
    if (response.status == 'ok') {
      scroll(0,0)
	  $(".wrapper, .footer").removeClass("blur");
	  $("#modal").hide();
      $('#suggest_sent').show().fadeOut(4000);
    }
    });

/*
	$(".wrapper, .footer").addClass("blur");
	$("#modal").show();
*/

	
	
});


$(document).keyup(function(e) {
  if (e.keyCode == 27) { 
	$(".wrapper, .footer").removeClass("blur");
	$("#modal").hide();
	 }   // esc
});