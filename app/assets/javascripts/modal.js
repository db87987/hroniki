$(document).ready(function() {
	
	$("#suggest_hronik").on('click', function () {
		$(".wrapper, .footer").addClass("blur");
		$("#modal").show();
	});
	
	$(".close_modal").on('click', function () {
		$(".wrapper, .footer").removeClass("blur");
		$("#modal").hide();
	});
	
	
	
	
});


$(document).keyup(function(e) {
  if (e.keyCode == 27) { 
	$(".wrapper, .footer").removeClass("blur");
	$("#modal").hide();
	 }   // esc
});