$(function(){
	$('#a3').on('click', function(){
		$("#a3").css("display", "none")
		$("#b3").css("display", "block")
		$("#rvmenuList").toggle('slow');
	});	
	$('#b3').on('click', function(){
		$("#a3").css("display", "block")
		$("#b3").css("display", "none")
		$("#rvmenuList").toggle('slow');	
		
	});	
});

/*mypage_reservation*/
$(function(){
	//날짜 입력박스 datepicker 셋팅
	$(".cal1").datepicker({
		dateFormat : 'yy-mm-dd',
		numberOfMonths : 1,
		showOn: "button",
	    buttonImage: "img/ca.jpg",
	    buttonImageOnly: true,
	    buttonText: "Select date",
	    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	});
	
	$(".cal1").click(function(){
		$(".cal1").datepicker({
			dateFormat : 'yy-mm-dd',
			numberOfMonths : 1,
			showOn : "input",
		    buttonText: "Select date",
		    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
		});
	});
	
});