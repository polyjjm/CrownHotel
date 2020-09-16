$(function(){
	$('#a3').on('click', function(){
		$("#a3").css("display", "none")
		$("#b3").css("display", "block")
		$("#memenuList").toggle('slow');
	});	
	$('#b3').on('click', function(){
		$("#a3").css("display", "block")
		$("#b3").css("display", "none")
		$("#memenuList").toggle('slow');
	});	
	
});