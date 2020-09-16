<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/crown/css/introduce.css" type="text/css"/>
</head>
<body>
<section>
<div id="introduceCenter">
	<!-- 맨위 상단 홈 ,약관동의  -->
	<div id="introduceBar">
	 	<span class="introduce_home">홈</span> / <span class="introduce_home">크라운 호텔 소개</span>
	</div>
	<!-- 메인 센터 -->
	<div>
	
		<div id="introduceName">크라운 호텔 소개</div>
		<!-- 크라운 호텔 소개 문구 -->
		<div id="introduceMainText"><p>국내 최고의 럭셔리 비즈니스 크라운 호텔 서울은 1,015실 규모를 자랑하며 서울 소공동에 자리잡고 있습니다. 명동, 을지로, 청계천 등 서울의 중심 관광지들로의 접근성이 뛰어나 서울 관광을 위한 최적의 위치를 자랑합니다. 네 개의 세계적인 인테리어 회사들이 참가하여 설계한 독창적인 인테리어의 객실은 최신 트렌드를 반영하고 있으며, 성공적인 비즈니스를 위한 클럽 플로어에서는 품위와 정교함을 느끼실 수 있습니다. 또한,크라운호텔 서울에서는 따뜻하고 고급의 가족모임과 럭셔리 웨딩, 대규모 국제회의 진행 등의 비즈니스 행사를 위한 최상의 시설을 제공하고 있으며, 최고급 레스토랑 또한 국빈 등 VIP고객을 모시기에 최적의 선택입니다.</p></div>
		
		<!-- 이미지,텍스트 룸 -->
		<div>
			<div><a href="<%=ctx%>/roomMain"><img src="<%=request.getContextPath()%>/img/room_introduce.jpg" id="introduecImgRoom"/></a></div>
			<div class="introduce_roomtext_first">객실</div>
			<div class="introduce_roomtext_second">비즈니스 고객을 다양한 고객이 만족할 수 있는 맞춤형 공간을 제공합니다.</div>
			<div class="introduce_roomtext_tree">- 전 객실에서 서울 도심의 환상적인 야경을 감상<br>
				 								 - 최신 시설과 현대적인 감각의 인테리어<br/>
				 								 - 최상의 평온함을 위한 해온(he:on)베딩 시스템
			</div>
			<div class="introduce_look"><a href="<%=ctx%>/roomMain" class="introduce_a_tag">자세히 보기></a></div>
		</div>
		<!-- 이미지,텍스트 다이닝 -->
		<div id="introduceDaning">
			<div><a href="<%=ctx%>/diningMain"><img src="<%=request.getContextPath()%>/img/daning.jpg" id="introduecImgDaing"/></a></div>
			<div class="introduce_roomtext_first">다이닝</div>
			<div class="introduce_roomtext_second">세계적인  셰프들이 직접 선보이는 다양한 일품요리를 즐기실수 있습니다.</div>
			<div class="introduce_roomtext_tree">- 미쉐린 2스타 레스토랑 피에르 가니에르 서울<br/>
												 - 신선한 재료를 엄선하여 만든 최고급 요리<br/>
				 								 - 세련되고 현대적인 감각의 호텔 레스토랑
			</div>
			<div class="introduce_look"><a href="<%=ctx%>/diningMain" class="introduce_a_tag">자세히 보기></a></div>
			
		</div>
		
		<hr/>
		<div id="introduceHT">
		<div id="introduceHotel">호텔정보</div><div id="introduceHotelText">크라운 호텔 서울 객실 및 다이닝,연회 시설에 대한 자세한 정보를 확인하실 수 있습니다.<br/>문의사항이 있으신 분들은 질문해주시기 바랍니다.</div>
		<button id="introduceBtn"><a herf="<%=ctx%>/boardList">문의사항</a></button>
		</div>
	
	
	
	
	
	
	</div><!-- 메인 센터 -->
</div>
</section>
</body>
</html>