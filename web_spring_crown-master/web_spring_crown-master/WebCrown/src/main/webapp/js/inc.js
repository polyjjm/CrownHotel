$(function(){
	
	//서브메뉴 마우스 hover시 슬라이드
	$("#hMenu>ul>li").on({"mouseenter":function(){
		
		var submenu = $(this).children("div");
		console.log(submenu.css("height"));
		var wapper = $("#hWapper");
		var subMenuHeight = submenu.css("height");
		
			wapper.css("height",subMenuHeight);
			//.stop() 메소드를 반드시 넣어야함 : 다른 요소에 이벤트 발생시 멈췄다가 이벤트 발생
			wapper.stop().slideDown(350);
			if(submenu.css("display")=="none"){
				
				submenu.delay(300).animate({opacity:1},0);
				submenu.css("display","block").css("z-index","1050");
				
			}
		},"mouseleave":function(){
			var submenu = $(this).children("div");
			var wapper = $("#hWapper");
			var subMenuHeight = submenu.css("height");
			wapper.stop().slideUp(350);
			if(submenu.css("display")=="block"){
				submenu.delay(200).animate({opacity:0},0);
				submenu.css("display","none")
			}	

		}
	});
	
	var scrollValue=0;
	//헤더 스크롤 시 이벤트
	$(window).scroll(function (){		
		scrollValue = $(document).scrollTop();
		console.log(scrollValue);
		if(scrollValue>150){
			$("#headerTop").css("display","none");
			$("header").css("position","sticky").css("top","0").css("z-index","200");
			
		}else if(scrollValue<=0){
			$("#headerTop").css("display","block");
		}
	});
	
	
/////////////////////////////////////////////
		
		$.ajax({
			type : "GET",
			url : "/crown/ajaxSelectRoomType",
			success : function(result){		
				var data = $(result);
				var standTag ="<li>스탠다드</li>";
				var clubTag ="<li>클럽 플로어</li>";
				var suitTag = "<li>스위트</li>";
				// room_type 모든 레코드를 가져와서 
				// room_type 별로 나누어서 
				// room_name 을 넣어준다.
				console.log("ajax 탭메뉴 data : "+data);
				data.each(function(i, vo){
					console.log(i+"=room_type 명 : "+vo.room_type);
					if(vo.room_type=='스탠다드'){
						console.log("스탠다드 메뉴 그려주기 ");
						standTag += "<li><a href='/crown/room?room_type_code="+vo.room_type_code+"'>"+vo.room_name+"<a></li>";
					}else if(vo.room_type=='클럽 플로어'){
						console.log("클럽 플로어 메뉴 그려주기 ");
						clubTag += "<li><a href='/crown/room?room_type_code="+vo.room_type_code+"'>"+vo.room_name+"<a></li>";
					}else if(vo.room_type=='스위트'){
						console.log("스위트");
						suitTag += "<li><a href='/crown/room?room_type_code="+vo.room_type_code+"'>"+vo.room_name+"<a></li>";
					}else{
						console.log("객실 타입 그외");
					}
				});
				//메뉴 추가
				$("#roomTypeStandard").html(standTag);
				$("#roomTypeClub").html(clubTag);
				$("#roomTypeSuit").html(suitTag);
			},
			error : function(e){
				console.log(e.responseText);
			}
		});

	//////////////////////////////////////////////
	
	
	
});