<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/crown/css/introduce.css" type="text/css"/>
<meta charset="UTF-8">
<script>
		$(function() {
			$('ul.introduceTourCulture_tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.introduceTourCulture_tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
	</script>	
	
	
</head>
<body>
<section>
<div id="introduceTourCultureCenter">
	<!-- 맨위 상단 홈  -->
	<div id="introduceTourCultureBar">
	 	<span class="introduceTourCulture_home">홈</span> / <span class="introduceTourCulture_home">크라운 호텔 소개</span> / <span class="introduceTourCulture_home">서울관광지 > 문화 관련 관광지</span>
	</div>
	
	<!-- 메인 센터 -->
	<div>
	
		<div id="introduceTourCultureName">주요 명소</div>
		
		<div id="introduceTourCultureHC"><button id="introduceTourCultureTagHistory"><a href="<%=request.getContextPath()%>/introduceTour" id="introduceTourCultureAtagHistory">역사 주요명소</a></button>&nbsp; <button id="introduceTourCultureAtagculture"><a href="#" id="introduceTourCultureAtagculture">문화 주요명소</a></button></div>
	
	
		<!-- 메뉴 탭 -->
		<div id="introduceTourCultureTab">
		
		<ul class="introduceTourCulture_tab">
			<li class="current" data-tab="tab1"><a href="#">체험</a></li>
			<li data-tab="tab2"><a href="#">쇼핑</a></li>
			<li data-tab="tab3"><a href="#">공연</a></li>
			
		</ul>
		<!-- 이미지,텍스트 -->
		<div><!-- 두번쨰,세번쨰 탭 메뉴 보이기-->
		<div id="tab1" class="tabcontent current">
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg1.jpg" class="introduceTourCulture_img_left">
			<div class=introduceTourCulture_subject_right1>서울시티투어버스</div>
			<div class="introduceTourCulture_content_right"><p>크라운호텔 롯데호텔 서울에서 3~5분 걸어가면 시티버스 정류장이 있어 다양한 장소로의 접근성이 뛰어납니다. 서울 시내 전체를 둘러보실 수 있는 관광 전용 버스입니다.
														<br/><br/><p>이동 소요 시간 : 광화문 광장 방향 도보 10분이내</p>
														<br/><br/><a href="https://www.seoulcitybus.com/main.do" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg2.jpg" class="introduceTourCulture_img_right">
			<div class="introduceTourCulture_subject_left">청계천</div>
			<div class="introduceTourCulture_content_left"><p>청계천 메인 입구는 롯데호텔 서울에서 서울 시청 방향으로 5분간 걸어 도착할 수 있으며, 시즌별로 등불 축제, 김장 축제 등 여러 축제에 참여하실 수 있습니다. 시청 청계광장에서 동대문까지 총 거리가 약 5.84km로 서울 도심에서 자연의 정취를 느끼실 수 있는 공간이기도 하며, 아침 조깅을 하기에도 좋은 장소입니다.
														<br/><br/><p>이동 소요 시간 : 서울시청 방향 도보 5분이내</p>
														<br/><br/><a href="http://korean.visitseoul.net/attractions/%EC%B2%AD%EA%B3%84%EC%B2%9C_/34" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg3.jpg" class="introduceTourCulture_img_left">
			<div class=introduceTourCulture_subject_right3>남산타워</div>
			<div class="introduceTourCulture_content_right"><p>크라운호텔 서울 뒤편에 있는 남산타워(N서울타워)는 서울 시내의 전경을 바라볼 수 있는 가장 높은 전망대로 도보, 케이블카, 버스 등 다양한 방법으로 롯데호텔 서울에서 쉽게 찾아가실 수 있습니다. 나무가 우거지고 꽃이 예쁘게 핀 남산공원에 인접합니다.
														<br/><br/><p>이동 소요 시간 : 인사동 방향 차로 5~10분 이내</p>
														<br/><br/><a href="https://www.nseoultower.co.kr:8501/index.asp" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg4.jpg" class="introduceTourCulture_img_right">
			<div class="introduceTourCulture_subject_left">문화역사서울 284(구, 서울역사)</div>
			<div class="introduceTourCulture_content_left"><p>서울역사(驛舍)는 동경대 교수였던 일본인 쓰가모토 야스시(塚本靖)가 설계하고, 1922년 6월에 착공하여 1925년 9월에 준공되었다. 당시 신축된 건물은 규모도 상당하였지만 지붕의 돔과 독특한 외관으로 장안의 화제가 되었다. 건축 자재는 주로 붉은 벽돌을 사용하였으며 1층 중앙홀은 바닥을 화강암을 깔고 중벽은 석재, 벽에는 인조석을 붙였다. 건물 안의 귀빈실 마루바닥은 모두 박달나무로 깔았고 2층에는 양식당을 설치하였다.
														
														<br/><br/><a href="https://www.seoul284.org/" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/><br/><br/>
			<hr/>
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg5.jpg" class="introduceTourCulture_img_left">
			<div class=introduceTourCulture_subject_right4>홍대</div>
			<div class="introduceTourCulture_content_right"><p>크라운호텔 서울에서 대중교통으로 약 15분 거리에 위치한 홍대는 젊은 세대가 가장 많이 찾는 서울의 핫플레이스입니다. 상점, 레스토랑, 클럽, 복합 문화 공간이 즐비합니다. 홍대 인근에 있는 합정과 상수에서 이색적인 카페를 찾으실 수 있으며 연남동, 망리단길까지 연결되어 서울을 즐기기에 제격입니다. 2호선 홍대입구역에서부터 홍익대학교 정문까지 다양한 놀거리, 먹거리, 볼거리가 많습니다.
																※사진제공(이범수)-한국관광공사
														<br/><br/><p>이동 소요 시간 : 청계천 방향 차로 5~10분 이내</p>
														<br/><br/><a href="http://korean.visitseoul.net/mapo-around" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<div>
			<div id="introduceTourCultureHistoryAdd">문화 주요명소 더 보기</div>
			<div id="introduceTourCultureMaul"><p class="introduceTourCulture_history_text">쇼핑</p><a href="#" class="introduceTourCulture_atag_look"><p class="introduceTourCulture_look">자세히 보기></p></a></p></div>
			<div id="introduceTourCultureMuseum"><p class="introduceTourCulture_history_text">공연</p><a href="#" class="introduceTourCulture_atag_look"><p class="introduceTourCulture_look">자세히 보기></p></a></p></div>
			</div>
		

		</div>


		<div id="tab2" class="tabcontent">
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg6.jpg" class="introduceTourCulture_img_left">
			<div class=introduceTourCulture_subject_right2>명동 쇼핑</div>
			<div class="introduceTourCulture_content_right"><p>크라운호텔 롯데호텔 서울 건너편에 위치해 도보로 3분 내에 도착하실 수 있는 명동 거리에서는 다양한 길거리 음식과 함께 한국 화장품, 의류, 신발, K-pop 기념품 등 유행하는 상품을 한눈에 살펴보실 수 있습니다.
														<br/><br/><p>이동 소요 시간 :크라운호텔 서울에서 도보로 3 분 이내</p>
														<br/><br/><a href="http://korean.visitseoul.net/shopping?srchType=&srchOptnCode=&srchCtgry=&sortOrder=&srchWord=" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg7.jpg" class="introduceTourCulture_img_right">
			<div class="introduceTourCulture_subject_left">남대문 시장</div>
			<div class="introduceTourCulture_content_left"><p>크라운호텔 서울에서 걸어서 5~10분 내에 도착할 수 있으며, 다양한 상품을 판매하는 남대문 시장은 대표적인 전통 시장입니다.크라운호텔 서울의 무료 셔틀버스를 이용하여 남대문 전통시장까지 편하게 이동하실 수 있습니다.
														<br/><br/><p>이동 소요 시간 : 한국은행 방향 도보 5~10분 이내</p>
														<br/><br/><a href="http://korean.visitseoul.net/shopping/%EB%82%A8%EB%8C%80%EB%AC%B8%EC%8B%9C%EC%9E%A5_/85" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/><br/><br/>
			<hr/>
			
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg8.jpg" class="introduceTourCulture_img_left">
			<div class=introduceTourCulture_subject_right>동대문</div>
			<div class="introduceTourCulture_content_right"><p>택시로 10여 분 동안 이동하거나 지하철로 3개의 역을 이동하면 도착하는 우리나라 최대 규모의 패션 시장입니다. 한국 패션 브랜드를 저렴한 가격에 구매할 수 있고 야시장을 운영하여 24시간 구애받지 않으며 자유롭게 쇼핑하실 수 있습니다. 동대문 역사문화 공원과 동대문 디자인플라자(DDP)가 인접하여 다양한 먹거리 및 즐길거리가 가득합니다.
														<br/><br/><p>이동 소요 시간 :종각역 방향 도보 15분이내</p>
														<br/><br/><a href="http://korean.visitseoul.net/shopping/%EB%8F%99%EB%8C%80%EB%AC%B8-%EC%A2%85%ED%95%A9%EC%8B%9C%EC%9E%A5_/170" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			
			<div>
			<div id="introduceTourCultureHistoryAdd">역사 주요명소 더 보기</div>
			<div id="introduceTourCultureMaul"><p class="introduceTourCulture_history_text">체험</p><a href="#" class="introduceTourCulture_atag_look"><p class="introduceTourCulture_look">자세히 보기></p></a></p></div>
			<div id="introduceTourCultureMuseum"><p class="introduceTourCulture_history_text">공연</p><a href="#" class="introduceTourCulture_atag_look"><p class="introduceTourCulture_look">자세히 보기></p></a></p></div>
			</div>
		</div><!-- tab2 -->

		<div id="tab3" class="tabcontent">
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg11.jpg" class="introduceTourCulture_img_left">
			<div class=introduceTourCulture_subject_right2>세종문화회관</div>
			<div class="introduceTourCulture_content_right"><p>크라운호텔서울에서 약 5분에서 10분 정도 걸어 광화문의 세종문화회관에 도착하실 수 있습니다. 세종문화회관에는 다양한 공연, 전시, 기획전 등이 상시로 진행되어 하루를 더욱 풍성하게 해줍니다.
																※사진제공(김지호)-한국관광공사
														<br/><br/><p>이동 소요 시간 : 삼청동 방향 차로 5~10분 이내</p>
														<br/><br/><a href="https://www.sejongpac.or.kr/portal/main/main.do" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg12.jpg" class="introduceTourCulture_img_right3">
			<div class="introduceTourCulture_subject_left">난타공연장</div>
			<div class="introduceTourCulture_content_left"><p>난타공연장은 명동 내에 있는 극장으로 크라운호텔서울에서 걸어서 5분 거리에 있습니다. 독특한 퍼포먼스로 외국인 관광객에게 특히나 인기가 많습니다.
														<br/><br/><p>이동 소요 시간 : 충무로 방향 차로 5~10분</p>
														<br/><br/><a href="http://korean.visitseoul.net/attractions/%EB%82%9C%ED%83%80%EC%A0%84%EC%9A%A9%EA%B4%80%EB%AA%85%EB%8F%99_/5791" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			
			<br/><br/>
			<hr/>
			
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourCultureImg13.jpg" class="introduceTourCulture_img_left">
			<div class=introduceTourCulture_subject_right>한국집</div>
			<div class="introduceTourCulture_content_right"><p>한국의 집 등 넌버벌(Non-Verbal) 퍼포먼스나 한국 전통 공연을 감상할 수 있는 문화예술 공간이 롯데호텔서울에서 도보 또는 차로 10분 이내의 거리에 있습니다.
※사																진제공(이범수)-한국관광공사
														<br/><br/><p>이동 소요 시간 : 삼청동 방향 차로 5~10분 이내</p>
														<br/><br/><a href="https://www.koreahouse.or.kr/ko/main" class="introduceTourCulture_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			
			<div>
			<div id="introduceTourCultureHistoryAdd">역사 주요명소 더 보기</div>
			<div id="introduceTourCultureMaul"><p class="introduceTourCulture_history_text">체험</p><a href="#" class="introduceTourCulture_atag_look"><p class="introduceTourCulture_look">자세히 보기></p></a></p></div>
			<div id="introduceTourCultureMuseum"><p class="introduceTourCulture_history_text">쇼핑</p><a href="#" class="introduceTourCulture_atag_look"><p class="introduceTourCulture_look">자세히 보기></p></a></p></div>
			</div>
			
		
		
		
			
		</div><!-- tab2 -->
		</div><!-- 이미지,텍스트 --><!-- 두번쨰,세번쨰 탭 메뉴 보이기-->
		
	</div><!-- 메뉴 탭 -->
  </div><!-- 메인센터 -->

</div><!-- 전체div -->	
</section>	
</body>
</html>

