$(function(){
	$('#a4').on('click', function(){
		$("#b4").css("display", "block")
		$("#a4").css("display", "none")
		$("#cpmenuList").toggle('slow');
	});	
	$('#b4').on('click', function(){
		$("#a4").css("display", "block")
		$("#b4").css("display", "none")
		$("#cpmenuList").toggle('slow');
	});	
});