$(document).ready(function() {
	
	$("#suggest_hronik").on('click', function () {
		$(".page_content").addClass("blur");
		$("#modal").show();
	});
	
});


$(document).keyup(function(e) {
  if (e.keyCode == 27) { 
	$(".page_content").removeClass("blur");
	$("#modal").hide();
	 }   // esc
});