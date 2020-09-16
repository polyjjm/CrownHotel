
$(document).ready(function(){
	
	/* 메인 슬릭스라이더 */
	$("#mslideBox").slick({
		infinite:true , 
	       slidesToShow:1, 
	       slidesToScroll:1,
	       autoplay:false, 
	       arrows:false,
	       prevArrow:$("#mSliderLeft"),
	       nextArrow:$("#mSliderRight"),
	       dots:true, 
	       speed:500
	});
	
	$("#mSliderLeft").click(function(){ 
		$(this).parent().find('#mslideBox').slick('slickPrev');
		$(this).focus();
	});
	$("#mSliderRight").click(function(){ 
		$(this).parent().find('#mslideBox').slick('slickNext');
		$(this).focus();
	});
	

	/*객실 인원 선택 팝업창 ================================================*/
	
	//객실, 인원 display
	$(document).on('click','.person_num_001, .search_person_close',function(){
		if($(".search_person_layer_001").css("display")=="none"){
			$(".search_person_layer_001").css("display","block");
		}else{
			$(".search_person_layer_001").css("display","none");
		}
		
	});
	
	//객실 , 인원 클릭
	var adult_cnt1=1;
	var child_cnt1=0;
	var adult_cnt2=0;
	var child_cnt2=0;
	var adult_cnt3=0;
	var child_cnt3=0;
	
	var max_person_cnt=3;
	var sum_room_cnt=1;
	var sum_adult_cnt=1;
	var sum_child_cnt=0;
	var room_num = Number($("#sumRoomText001").text());
	//증가 버튼
	$(document).on('click','.c-counter_button_increase',function(){
		var inp_adult_name = $(this).prev().prev().attr("name");
		var plus_btn = $(this);
		var minus_btn =$(this).prev().prev().prev();
		
		//객실 1 성인 클릭
		if(inp_adult_name=='rsv_adult'){
			console.log("객실 1 성인1 클릭");
			
			adult_cnt1 = Number($("#rsv_adult").val());
			child_cnt1 = Number($("#rsv_child").val());
			
			if(child_cnt1==0){ //어린이 0명
				if(adult_cnt1<3){	
					adult_cnt1++;
					sum_adult_cnt++;
					var text = "성인 "+adult_cnt1;
					$("#view_adult1").html(text);
					$("#rsv_adult").val(adult_cnt1);
				}
			}else if(child_cnt1==1){// 어린이 1명
				if(adult_cnt1<2){
					adult_cnt1++;
					sum_adult_cnt++;
					var text = "성인 "+adult_cnt1;
					$("#view_adult1").html(text);
					$("#rsv_adult").val(adult_cnt1);
				}
			}
			
			if(adult_cnt1>1){//마이너스 버튼 활성화
				minus_btn.prop("disabled", false);
				minus_btn.attr("class", "c-counter_button_decrease");
			}
			//성인 3명인 경우
			if(adult_cnt1>=3){
				var child_minus_btn = $("#view_child1").next();
				child_minus_btn.addClass("c-counter_button_disable");
				child_minus_btn.prop("disabled", true);
			}
			//총 인원 3명인 경우 플러스 버튼 disabled
			if(adult_cnt1+child_cnt1 >= 3){
				
				plus_btn.addClass("c-counter_button_disable");
				plus_btn.prop("disabled", true);
			}
			
		//객실 1 어린이 클릭	
		}else if(inp_adult_name=='rsv_child'){
			adult_cnt1 = Number($("#rsv_adult").val());
			child_cnt1 = Number($("#rsv_child").val());
			
			if(adult_cnt1<3 && child_cnt1<1){					
				child_cnt1 = 1;
				sum_child_cnt += 1;
				var text = "어린이 " + child_cnt1;
				$("#view_child1").html(text);
				$("#rsv_child").val(child_cnt1);
				
				minus_btn.prop("disabled", false);
				minus_btn.attr("class", "c-counter_button_decrease");
				plus_btn.addClass("c-counter_button_disable");
				plus_btn.prop("disabled", true);
				
				if(adult_cnt1==2){
					var plus_btn = $("#view_adult1").next();
					plus_btn.addClass("c-counter_button_disable");
					plus_btn.prop("disabled", true);
				}
				
			}
		
		}
		
		//객실 2 성인 클릭
		if(inp_adult_name=='rsv_adult1'){
			adult_cnt2 = Number($("#rsv_adult1").val());
			child_cnt2 = Number($("#rsv_child1").val());
			adult_cnt3 = Number($("#rsv_adult2").val());
			if(child_cnt2==0){ //어린이 0명
				if(adult_cnt2 < 3){	
					adult_cnt2++;
					sum_adult_cnt++;
					var text = "성인 "+adult_cnt2;
					$("#view_adult2").html(text);
					$("#rsv_adult1").val(adult_cnt2);
					//객실 추가
					if(adult_cnt3==0){
						sum_room_cnt = 2;
					}else{
						sum_room_cnt = 3;
					}
					
					//어린이 disabled 해제
					$("#view_child2").attr("class", "c-counter_view_001");
					var child_plus_btn = $("#view_child2").next();
					child_plus_btn.prop("disabled", false);
					child_plus_btn.attr("class", "c-counter_button_increase");
					
				}
			
			}else if(child_cnt2==1){// 어린이 1명
				if(adult_cnt2<2){
					adult_cnt2++;
					sum_adult_cnt++;
					var text = "성인 "+adult_cnt2;
					$("#view_adult2").html(text);
					$("#rsv_adult1").val(adult_cnt2);
				}
			}
			
			if(adult_cnt2>0){//마이너스 버튼 활성화
				minus_btn.prop("disabled", false);
				minus_btn.attr("class", "c-counter_button_decrease");
			}
			//성인 3명인 경우
			if(adult_cnt2>=3){
				var child_minus_btn = $("#view_child2").next();
				child_minus_btn.addClass("c-counter_button_disable");
				child_minus_btn.prop("disabled", true);
			}
			//총 인원 3명인 경우 플러스 버튼 disabled
			if(adult_cnt2+child_cnt2 >= 3){
				
				plus_btn.addClass("c-counter_button_disable");
				plus_btn.prop("disabled", true);
				
			}
		//객실 2 어린이 클릭	
		}else if(inp_adult_name=='rsv_child1'){
			adult_cnt2 = Number($("#rsv_adult1").val());
			child_cnt2 = Number($("#rsv_child1").val());
			
			if(adult_cnt2<3 && child_cnt2<1){					
				child_cnt2 = 1;
				sum_child_cnt += 1;
				var text = "어린이 " + child_cnt2;
				$("#view_child2").html(text);
				$("#rsv_child1").val(child_cnt2);
				
				minus_btn.prop("disabled", false);
				minus_btn.attr("class", "c-counter_button_decrease");
				plus_btn.addClass("c-counter_button_disable");
				plus_btn.prop("disabled", true);
				
				if(adult_cnt2==2){
					var plus_btn = $("#view_adult2").next();
					plus_btn.addClass("c-counter_button_disable");
					plus_btn.prop("disabled", true);
				}
			}
		}
		
		//객실 3 성인 클릭
		if(inp_adult_name=='rsv_adult2'){
			adult_cnt3 = Number($("#rsv_adult2").val());
			child_cnt3 = Number($("#rsv_child2").val());
			adult_cnt2 = Number($("#rsv_adult1").val());
			if(child_cnt3==0){ //어린이 0명
				if(adult_cnt3 < 3){	
					adult_cnt3++;
					sum_adult_cnt++;
					var text = "성인 "+adult_cnt3;
					$("#view_adult3").html(text);
					$("#rsv_adult2").val(adult_cnt3);
					//객실 추가
					if(adult_cnt2==0){
						sum_room_cnt = 2;
					}else{
						sum_room_cnt = 3;
					}
					
					//어린이 disabled 해제
					$("#view_child3").attr("class", "c-counter_view_001");
					var child_plus_btn = $("#view_child3").next();
					child_plus_btn.prop("disabled", false);
					child_plus_btn.attr("class", "c-counter_button_increase");
					
				}
			
			}else if(child_cnt3==1){// 어린이 1명
				if(adult_cnt3<2){
					adult_cnt3++;
					sum_adult_cnt++;
					var text = "성인 "+adult_cnt3;
					$("#view_adult3").html(text);
					$("#rsv_adult2").val(adult_cnt3);
				}
			}
			
			if(adult_cnt3>0){//마이너스 버튼 활성화
				minus_btn.prop("disabled", false);
				minus_btn.attr("class", "c-counter_button_decrease");
			}
			//성인 3명인 경우
			if(adult_cnt3>=3){
				var child_minus_btn = $("#view_child3").next();
				child_minus_btn.addClass("c-counter_button_disable");
				child_minus_btn.prop("disabled", true);
			}
			//총 인원 3명인 경우 플러스 버튼 disabled
			if(adult_cnt3+child_cnt3 >= 3){
				
				plus_btn.addClass("c-counter_button_disable");
				plus_btn.prop("disabled", true);
				
			}
		//객실 3 어린이 클릭	
		}else if(inp_adult_name=='rsv_child2'){
			adult_cnt3 = Number($("#rsv_adult2").val());
			child_cnt3 = Number($("#rsv_child2").val());
			
			if(adult_cnt3<3 && child_cnt3<1){					
				child_cnt3 = 1;
				sum_child_cnt += 1;
				var text = "어린이 " + child_cnt3;
				$("#view_child3").html(text);
				$("#rsv_child2").val(child_cnt3);
				
				minus_btn.prop("disabled", false);
				minus_btn.attr("class", "c-counter_button_decrease");
				plus_btn.addClass("c-counter_button_disable");
				plus_btn.prop("disabled", true);
				
				if(adult_cnt3==2){
					var plus_btn = $("#view_adult3").next();
					plus_btn.addClass("c-counter_button_disable");
					plus_btn.prop("disabled", true);
				}
			}
		}
		//객실 추가
		$("#sumRoomText001").html(sum_room_cnt);
		$("#rsv_room_count").val(sum_room_cnt);
		//총 성인 인원
		$("#sumAdultText001").html(sum_adult_cnt);
		//총 어린이 인원
		$("#sumChildText001").html(sum_child_cnt);
		
		
	});
	
	//감소 버튼
	$(document).on('click','.c-counter_button_decrease',function(){
		var inp_name = $(this).next().attr("name");
		var plus_btn = $(this).next().next().next();
		var minus_btn =$(this);
		//객실1
		if(inp_name=='rsv_adult'){
			adult_cnt1 = Number($("#rsv_adult").val());
			child_cnt1 = Number($("#rsv_child").val());
			console.log("감소 버튼 adult_cnt1= "+adult_cnt1);
			
			if(adult_cnt1>1){// 2에서 감소 3에서 감소
				plus_btn.prop("disabled", false);
				plus_btn.attr("class", "c-counter_button_increase");
				console.log("11 객실1 감소 : adult_cnt1"+adult_cnt1);
				adult_cnt1--;
				sum_adult_cnt--;
				var text = "성인 "+adult_cnt1;
				$("#view_adult1").html(text);
				$("#rsv_adult").val(adult_cnt1);
				console.log("22 객실1 감소 버튼 : adult_cnt1"+adult_cnt1);
				if(adult_cnt1==2){//성인 2명일 떄
					console.log("33 객실1 감소 버튼 :22 adult_cnt1"+adult_cnt1);
					var child_pulus_btn = $("#view_child1").next();
					child_pulus_btn.prop("disabled", false);
					child_pulus_btn.attr("class", "c-counter_button_increase");
				}
				
			
			}
			if(adult_cnt1==1){
				minus_btn.addClass("c-counter_button_disable");
				minus_btn.prop("disabled", true);
				//총 성인 인원
				$("#sumAdultText001").html(sum_adult_cnt);
				return false;
			}
		}else if(inp_name=='rsv_child'){
			adult_cnt1 = Number($("#rsv_adult").val());
			child_cnt1 = Number($("#rsv_child").val());
			if(child_cnt1==1){
				plus_btn.prop("disabled", false);
				plus_btn.attr("class", "c-counter_button_increase");
				
				child_cnt1--;
				sum_child_cnt--;
				var text = "어린이 "+child_cnt1;
				$("#view_child1").html(text);
				$("#rsv_child").val(child_cnt1);
				
				minus_btn.addClass("c-counter_button_disable");
				minus_btn.prop("disabled", true);
				//성인 2명인 경우
				if(adult_cnt1==2){
					var adult_plus_btn = $("#view_adult1").next();
					adult_plus_btn.prop("disabled", false);
					adult_plus_btn.attr("class", "c-counter_button_increase");
				}
			}
		}
		
		//객실2
		if(inp_name=='rsv_adult1'){
			adult_cnt2 = Number($("#rsv_adult1").val());
			child_cnt2 = Number($("#rsv_child1").val());
			console.log("감소 버튼 adult_cnt2= "+adult_cnt2);
			
			if(adult_cnt2>0){
				plus_btn.prop("disabled", false);
				plus_btn.attr("class", "c-counter_button_increase");
				
				adult_cnt2--;
				sum_adult_cnt--;
				var text = "성인 "+adult_cnt2;
				$("#view_adult2").html(text);
				$("#rsv_adult1").val(adult_cnt2);
				if(adult_cnt2==2){//성인 2명일 떄
					
					var child_pulus_btn = $("#view_child2").next();
					child_pulus_btn.prop("disabled", false);
					child_pulus_btn.attr("class", "c-counter_button_increase");
				}
				
			}
			if(adult_cnt2==0){
				//객실 취소
				if(sum_room_cnt==2 || sum_room_cnt==3){
					sum_room_cnt--;
					$("#sumRoomText001").html(sum_room_cnt);
					$("#rsv_room_count").val(sum_room_cnt);
				}
				minus_btn.addClass("c-counter_button_disable");
				minus_btn.prop("disabled", true);
				child_cnt2=0;
				var text = "어린이 "+child_cnt2;
				$("#rsv_child1").val("0");
				$("#view_child2").html(text);
				$("#view_child2").addClass("c-counter_span_disable");
				$("#rsv_child1").prev().addClass("c-counter_button_disable");
				$("#rsv_child1").prev().prop("disabled", true);
				$("#view_child2").next().addClass("c-counter_button_disable");
				$("#view_child2").next().prop("disabled", true);
				//총 성인 인원
				$("#sumAdultText001").html(sum_adult_cnt);
				return false;
			}
		}else if(inp_name=='rsv_child1'){
			adult_cnt2 = Number($("#rsv_adult1").val());
			child_cnt2 = Number($("#rsv_child1").val());
			if(child_cnt2==1){
				plus_btn.prop("disabled", false);
				plus_btn.attr("class", "c-counter_button_increase");
				
				child_cnt2--;
				sum_child_cnt--;
				var text = "어린이 "+child_cnt2;
				$("#view_child2").html(text);
				$("#rsv_child1").val(child_cnt2);
				
				minus_btn.addClass("c-counter_button_disable");
				minus_btn.prop("disabled", true);
				
				//성인 2명인 경우
				if(adult_cnt2==2){
					var adult_plus_btn = $("#view_adult2").next();
					adult_plus_btn.prop("disabled", false);
					adult_plus_btn.attr("class", "c-counter_button_increase");
				}
				
			}
		}
		
		//객실3
		if(inp_name=='rsv_adult2'){
			adult_cnt3 = Number($("#rsv_adult2").val());
			child_cnt3 = Number($("#rsv_child2").val());
			console.log("감소 버튼 adult_cnt3= "+adult_cnt3);
			
			if(adult_cnt3>0){
				plus_btn.prop("disabled", false);
				plus_btn.attr("class", "c-counter_button_increase");
				
				adult_cnt3--;
				sum_adult_cnt--;
				var text = "성인 "+adult_cnt3;
				$("#view_adult3").html(text);
				$("#rsv_adult2").val(adult_cnt3);
				
				if(adult_cnt3==2){//성인 2명일 떄
					
					var child_pulus_btn = $("#view_child3").next();
					child_pulus_btn.prop("disabled", false);
					child_pulus_btn.attr("class", "c-counter_button_increase");
				}
			}
			if(adult_cnt3==0){
				//객실 취소
				if(sum_room_cnt==2 || sum_room_cnt==3){
					sum_room_cnt--;
					$("#sumRoomText001").html(sum_room_cnt);
					$("#rsv_room_count").val(sum_room_cnt);
				}
				minus_btn.addClass("c-counter_button_disable");
				minus_btn.prop("disabled", true);
				child_cnt3=0;
				var text = "어린이 "+child_cnt3;
				$("#rsv_child2").val("0");
				$("#view_child3").html(text);
				$("#view_child3").addClass("c-counter_span_disable");
				$("#rsv_child2").prev().addClass("c-counter_button_disable");
				$("#rsv_child2").prev().prop("disabled", true);
				$("#view_child3").next().addClass("c-counter_button_disable");
				$("#view_child3").next().prop("disabled", true);
				//총 성인 인원
				$("#sumAdultText001").html(sum_adult_cnt);
				return false;
			}
		}else if(inp_name=='rsv_child2'){
			adult_cnt3 = Number($("#rsv_adult2").val());
			child_cnt3 = Number($("#rsv_child2").val());
			if(child_cnt3==1){
				plus_btn.prop("disabled", false);
				plus_btn.attr("class", "c-counter_button_increase");
				
				child_cnt3--;
				sum_child_cnt--;
				var text = "어린이 "+child_cnt3;
				$("#view_child3").html(text);
				$("#rsv_child2").val(child_cnt3);
				
				minus_btn.addClass("c-counter_button_disable");
				minus_btn.prop("disabled", true);
				//성인 2명인 경우
				if(adult_cnt3==2){
					var adult_plus_btn = $("#view_adult3").next();
					adult_plus_btn.prop("disabled", false);
					adult_plus_btn.attr("class", "c-counter_button_increase");
				}
			}
		}
		
		//객실 취소
		$("#sumRoomText001").html(sum_room_cnt);
		
		//총 성인 인원
		$("#sumAdultText001").html(sum_adult_cnt);
		//총 어린이 인원
		$("#sumChildText001").html(sum_child_cnt);
		
	});
	/*객실 인원 선택 팝업창 끝 ================================================*/
	
	//=========달력====================	
	var date = new Date();
	var currentMonth = date.getMonth();
	var currentDate = date.getDate();
	var currentYear = date.getFullYear();
		
	var startDate;
	var endDate;
	$(".rsv_date_001").daterangepicker({
		
		timePicker:false,
	    startOfWeek: 'sunday',
	    minDate : moment(date),
	    maxDate : moment(date.getTime()).add("6", "M").format("YYYY-MM-DD"),
	    drops: 'up',
	    dateLimit: { 
	    	days: 30 
	    },
	    startDate: false,
	    endDate: false,
	    locale: {
	      "format" : 'YYYY-MM-DD',
	      "applyLabel": "적용",
	      "cancelLabel": "취소",
	      "separator": " - ",
	      "customRangeLabel": "Custom",
	      "daysOfWeek": [
	            "일",
	            "월",
	            "화",
	            "수",
	            "목",
	            "금",
	            "토"
	        ],
	       "monthNames": [
	            "1월",
	            "2월",
	            "3월",
	            "4월",
	            "5월",
	            "6월",
	            "7월",
	            "8월",
	            "9월",
	            "10월",
	            "11월",
	            "12월"
	        ]
	    }

	});
	var getWeek = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
	//달력 클릭
	$(document).on('click','.applyBtn',function(){
		var getDate = $(".drp-selected").text();
		console.log("span 안에 데이트 : "+getDate);
		
		var getDate2 = getDate.split(" - ");
		var startDate = getDate2[0].split("-");
		var endDate = getDate2[1].split("-");
		var startMonth = startDate[1];
		var startDay = startDate[2];
		var endMonth = endDate[1];
		var endDay = endDate[2];
		//요일 구하기
		
		var startWeek = getWeek[new Date(getDate2[0]).getDay()];
		var endtWeek = getWeek[new Date(getDate2[1]).getDay()];
		//input 세팅
		$('#rsv_check_in001').val(getDate2[0].replace(/-/g,""));
		$('#rsv_check_out001').val(getDate2[1].replace(/-/g,""));
		// 뷰단 세팅
		$("#startDay001").html(startDay);
		$("#startMonth001").html(startMonth+"월");
		
		$("#endDay001").html(endDay);
		$("#endMonth001").html(endMonth+"월");
		
		$("#startWeek001").html(startWeek);
		$("#endWeek001").html(endtWeek);
		
		//박 세팅
		var s = new Date(getDate2[0]);
		var e = new Date(getDate2[1]);
		var stayDay = (e-s)/(24 * 3600 * 1000);
		$(".night_001").html(stayDay);
	});

	$(document).on('click','.rsv_date_001',function(){
		console.log("date = "+date);
		if($(".search_person_layer_001").css("display")=="block"){
			$(".search_person_layer_001").css("display","none");
		}	
	});
	
	
	
	startMap();
});

//지도의 정보를 표시할 함수
// 위도 : latitude , 경도 : longitude
function startMap(){
	var latitude = 37.5367327;
	var longitude = 126.9697869;
	//지도의 가운데를 지정한다.
	var myCenter = new google.maps.LatLng(latitude, longitude);
	// 지도 그릴떄 필요한 기타정보를 JSON형식의 데이터 생성한다.
	var mapProperty = {center : myCenter,
						zoom : 18,//0~21사이의 값을 사용한다. 숫자가 클수록 확대 
						mapTypeId : google.maps.MapTypeId.ROADMAP //지도종류(ROADMAP, HYBRID, SATELLITE,TERRAIN)	
						}
	
	//맵객체 생성하기				(지도를 보여줄 곳, 맵옵션)
	var map = new google.maps.Map(document.getElementById("mLocMap"), mapProperty);
	
	//마커 표시하기
	var marker = new google.maps.Marker({
		position:myCenter,//마커를 표시할 곳
		map:map,//지도선택
		title:'마커에 표시할 내용'
	});
	marker.setMap(map);//지도에 마커 세팅
	
	//마커 클릭시 대화상자 띄우기
	//대화상자에 표시할 내용
	var information = "크라운 호텔";
	
	var info = new google.maps.InfoWindow({content:information});

	//이벤트 등록				//(이벤트 발생 대상,이벤트종류,
	google.maps.event.addListener(marker,"click",function(){info.open(map, marker)});
	
	//여러개의 마커표시
	for(i=0; i<lati.length; i++){
		var mk = new google.maps.Marker({position:new google.maps.LatLng(lati[i],longi[i]),
										 map:map,
										 title:"latitude:="+lati[i]+", longitude:"+longi[i]
										 });
		mk.setMap(map);
	}
}





