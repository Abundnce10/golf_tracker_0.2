$(document).ready(function() {
  $('#played_hole_putts').on('change', function() {
  	var h1 = $('h1').text();
    var start = parseInt(h1.indexOf("Par"));
  	var par = parseInt(h1.substring(start+4,start+5));
  	var strokes = parseInt($('#played_hole_strokes').val());
	var putts = parseInt($('#played_hole_putts').val());
	if ((strokes - putts) <= (par-2)) {
	  $('#played_hole_GIR').val('1');
	} else {
		$('#played_hole_GIR').val('0');
	}
  });
   $('#played_hole_strokes').on('change', function() {
  	var h1 = $('h1').text();
    var start = parseInt(h1.indexOf("Par"));
  	var par = parseInt(h1.substring(start+4,start+5));
  	var strokes = parseInt($('#played_hole_strokes').val());
	var putts = parseInt($('#played_hole_putts').val());
	if ((strokes - putts) <= (par-2)) {
	  $('#played_hole_GIR').val('1');
	} else {
		$('#played_hole_GIR').val('0');
	}
  });
});