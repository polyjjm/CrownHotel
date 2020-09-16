$(function(){
	$('#a2').on('click', function(){
		$("#b2").css("display", "block")
		$("#a2").css("display", "none")
		$("#mpmenuList").toggle('slow');
	});	
	$('#b2').on('click', function(){
		$("#a2").css("display", "block")
		$("#b2").css("display", "none")
		$("#mpmenuList").toggle('slow');
	});	
});



/*mypage_reservation*/
$(function(){
	//다이얼로그 이벤트 등록
	$("#dialogOpen").click(function(){
		
		//$("#dialog").dialog('open');
	});
	
	//날짜 입력박스 datepicker 셋팅
	/*$(".cal").datepicker({
		dateFormat : 'yy년 mm월 dd일',
		numberOfMonths : 1,
		showOn: "button",
	    buttonImage: "/crown/img/ca.jpg",
	    buttonImageOnly: true,
	    buttonText: "Select date",
	    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	});*/
	
});


/*mypage reservation 달력*/
$(function(){
	//다이얼로그 이벤트 등록
	$("#dialogOpen").click(function(){
		console.log("다이얼로그 오픈");
	//	$("#dialog").dialog('open');
	});
	
	//날짜 입력박스 datepicker 셋팅
	/*$(".cal1").datepicker({
		dateFormat : 'yy년 mm월 dd일',
		numberOfMonths : 1,
		showOn: "button",
	    buttonImage: "/crown/img/ca.jpg",
	    buttonImageOnly: true,
	    buttonText: "Select date",
	    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	});*/
	
});
