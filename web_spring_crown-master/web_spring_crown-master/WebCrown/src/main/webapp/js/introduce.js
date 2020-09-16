	//지도의 정보를 표시할 함수
	// 위도 : latitude , 경도 : longitude
	var latitude  = 37.5367327;
	var longitude = 126.9697869;
	
	//	var lati = [37.5721513, 37.5722623, 37.5723433, 37.5724843, 37.5725753 ];
	//	var longi = [126.9791518, 126.9793678, 126.9796378, 126.9798078, 126.9797878 ];
	function initMap(){ 
		//지도의 가운데를 지정한다. 
		var myCenter = new google.maps.LatLng(latitude, longitude);
		// 지도 그릴떄 필요한 기타정보를 JSON형식의 데이터 생성한다.
		var mapProperty = {center : myCenter,
							zoom : 18,//0~21사이의 값을 사용한다. 숫자가 클수록 확대 
							mapTypeId : google.maps.MapTypeId.ROADMAP //지도종류(ROADMAP, HYBRID, SATELLITE,TERRAIN)	
							}
		
		//맵객체 생성하기				(지도를 보여줄 곳, 맵옵션)
		var map = new google.maps.Map(document.getElementById("gMap"), mapProperty);
		
		//마커 표시하기
		var marker = new google.maps.Marker({
			position:myCenter,//마커를 표시할 곳
			map:map,//지도선택
			
			title:'마커에 표시할 내용'
		});
		marker.setMap(map);//지도에 마커 세팅
		
		//마커 클릭시 대화상자 띄우기
		//대화상자에 표시할 내용
		var information = "위도:"+latitude+"<br/>경도:"+longitude+"<br/>";
		
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
		
		
		myCity.setMap(map);
	}
	
//아코디언 메뉴(introduceLocation)
	$(function(){
		 
		
		
		
		   $("p.title").on('click',function(){
		      $(this).next(".answer").slideToggle(100);
		   }); 
		   
		   $("p.questionBox_title").on('click',function(){
		      
		      $(this).next(".questionBox_answer").slideToggle(100);
		   }); 
		   
		   var on = $("button.adminAnswerBox").hasClass("ON");
		 
		   
		   if(on == true){ 
		      $("button.adminAnswerBox").on('click',function(){
		        
		         $(this).next(".adminAnswer_text").slideToggle(100);
		      });
		   }else{
		      $("button.adminAnswerBox").css({
		         "background-color":"black" 
		         
		      });  
		   }
		}); 