// events

$(function() {
  $('#cropbox_event').Jcrop({
    onChange: event_update_crop,
    onSelect: event_update_crop,
    setSelect: [0, 0, 220, 220],
    aspectRatio: 220/220,
	boxWidth: 600
  });
});

function event_update_crop(coords) {
	$('#event_main').css({
		width: Math.round(220/coords.w * $('#cropbox_event').width()) + 'px',
		height: Math.round(220/coords.h * $('#cropbox_event').height()) + 'px',
		marginLeft: '-' + Math.round(220/coords.w * coords.x) + 'px',
		marginTop: '-' + Math.round(220/coords.h * coords.y) + 'px'
	});

  $("#event_crop_x").val(Math.round(coords.x));
  $("#event_crop_y").val(Math.round(coords.y));
  $("#event_crop_w").val(Math.round(coords.w));
  $("#event_crop_h").val(Math.round(coords.h));
};


// hroniks

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

// articles

$(function() {
  $('#cropbox_article').Jcrop({
    onChange: article_update_crop,
    onSelect: article_update_crop,
    setSelect: [0, 0, 220, 220],
    aspectRatio: 220/220,
	boxWidth: 600
  });
});

function article_update_crop(coords) {
	$('#article_main').css({
		width: Math.round(220/coords.w * $('#cropbox_article').width()) + 'px',
		height: Math.round(220/coords.h * $('#cropbox_article').height()) + 'px',
		marginLeft: '-' + Math.round(220/coords.w * coords.x) + 'px',
		marginTop: '-' + Math.round(220/coords.h * coords.y) + 'px'
	});

  $("#article_crop_x").val(Math.round(coords.x));
  $("#article_crop_y").val(Math.round(coords.y));
  $("#article_crop_w").val(Math.round(coords.w));
  $("#article_crop_h").val(Math.round(coords.h));
};

// olds

$(function() {
  $('#cropbox_old').Jcrop({
    onChange: article_update_crop,
    onSelect: article_update_crop,
    setSelect: [0, 0, 220, 220],
    aspectRatio: 220/220,
	boxWidth: 600
  });
});

function article_update_crop(coords) {
	$('#old_main').css({
		width: Math.round(220/coords.w * $('#cropbox_old').width()) + 'px',
		height: Math.round(220/coords.h * $('#cropbox_old').height()) + 'px',
		marginLeft: '-' + Math.round(220/coords.w * coords.x) + 'px',
		marginTop: '-' + Math.round(220/coords.h * coords.y) + 'px'
	});

  $("#old_crop_x").val(Math.round(coords.x));
  $("#old_crop_y").val(Math.round(coords.y));
  $("#old_crop_w").val(Math.round(coords.w));
  $("#old_crop_h").val(Math.round(coords.h));
};

