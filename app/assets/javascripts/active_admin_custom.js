$(function() {
  $('#cropbox').Jcrop({
    onChange: update_crop,
    onSelect: update_crop,
    setSelect: [0, 0, 940, 510],
    aspectRatio: 940/510,
	boxWidth: 600
  });
});

function update_crop(coords) {
	$('#main').css({
		width: Math.round(600/coords.w * $('#cropbox').width()) + 'px',
		height: Math.round(326/coords.h * $('#cropbox').height()) + 'px',
		marginLeft: '-' + Math.round(600/coords.w * coords.x) + 'px',
		marginTop: '-' + Math.round(326/coords.h * coords.y) + 'px'
	});

  $("#hronik_crop_x").val(Math.round(coords.x));
  $("#hronik_crop_y").val(Math.round(coords.y));
  $("#hronik_crop_w").val(Math.round(coords.w));
  $("#hronik_crop_h").val(Math.round(coords.h));
};
