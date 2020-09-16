$(function(){
	$('#a').on('click', function(){
		$("#b").css("display", "block")
		$("#a").css("display", "none")
		$("#ifmenuList").toggle('slow');
	});	
	$('#b').on('click', function(){
		$("#a").css("display", "block")
		$("#b").css("display", "none")
		$("#ifmenuList").toggle('slow');
	});	
});