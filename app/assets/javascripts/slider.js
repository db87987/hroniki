$(document).ready(function() {

	$("#left_arrow").on('click', function () {
		$(".slide:nth-child(1)").hide();
		$(".slide:nth-child(2)").show();
		return false
	});
	
});