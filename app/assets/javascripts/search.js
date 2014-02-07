$(document).ready(function() {
    $(".s-footer_search-submit").on('click', function () {
		$('#footsearch').submit();
		});
		
		$("#bodysearch > .red_button").on('click', function () {
			$('#bodysearch').submit();
			// event.preventDefault();
		});
});