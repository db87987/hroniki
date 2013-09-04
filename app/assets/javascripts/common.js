$(document).ready(function() {
    $("#header_link").on('click', function () {
		$(location).attr('href', '/');
	});
	
	$(".hroniki_image_container").on("mouseover",function () {
		$(this).find('.hroniki_hover_container').show();
	});
	

	$(".hroniki_image_container").mouseleave(function () {
		$('.hroniki_hover_container').hide();
	});
	
});