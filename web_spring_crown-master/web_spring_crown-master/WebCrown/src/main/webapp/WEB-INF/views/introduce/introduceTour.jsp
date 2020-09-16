<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/crown/css/introduce.css" type="text/css"/>
<meta charset="UTF-8">
<script>
		$(function() {
			$('ul.introduceTour_tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.introduceTour_tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
	</script>	
	
	
</head>
<body>
<section>
<div id="introduceTourCenter">
	<!-- 맨위 상단 홈  -->
	<div id="introduceTourBar">
	 	<span class="introduceTour_home">홈</span> / <span class="introduceTour_home">크라운 호텔 소개</span> / <span class="introduceTour_home">서울관광지 > 역사 관련 관광지</span>
	</div>
	
	<!-- 메인 센터 -->
	<div>
	
		<div id="introduceTourName">주요 명소</div>
		
		<div id="introduceTourHC"><button id="introduceTourTagHistory"><a href="#" id="introduceTourAtagHistory">역사 주요명소</a></button>&nbsp; <button id="introduceTourAtagculture"><a href="<%=request.getContextPath()%>/introduceTourCulture" id="introduceTourAtagculture">문화 주요명소</a></button></div>
	
	
		<!-- 메뉴 탭 -->
		<div id="introduceTourTab">
		
		<ul class="introduceTour_tab">
			<li class="current" data-tab="tab1"><a href="#">고궁</a></li>
			<li data-tab="tab2"><a href="#">한옥마을</a></li>
			<li data-tab="tab3"><a href="#">박물관</a></li>
			
		</ul>
		<!-- 이미지,텍스트 -->
		<div><!-- 두번쨰,세번쨰 탭 메뉴 보이기-->
		<div id="tab1" class="tabcontent current">
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg.jpg" class="introduceTour_img_left">
			<div class=introduceTour_subject_right>경복궁</div>
			<div class="introduceTour_content_right"><p>크라운호텔 서울에서 10여 분 걸어가면 도착할 수 있으며, 광화문 광장이나 청와대와 가깝습니다. 우리나라 대표 고궁인 경복궁은 왕의 집무실, 태후화 황후의 예쁜 궁궐과 정원, 연회를 열던 경회루 등이 있습니다. 때때로 야간개장을 하기도 하여 낮과 밤이 모두 아름다운 고궁입니다. 경복궁에서 진행되는 수문장 교대 의식 또한 관광객에게 인기가 많습니다. 근처에서 국립민속박물관, 국립현대미술관 서울, 국립고궁박물관 등을 둘러보실 수 있으며, 경복궁은 3호선 경복궁역이나 5호선 광화문역을 통해 가실 수 있습니다.
														<br/><br/><p>이동 소요 시간 : 광화문 광장 방향 도보 10분이내</p>
														<br/><br/><a href="http://www.royalpalace.go.kr/" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg2.jpg" class="introduceTour_img_right">
			<div class="introduceTour_subject_left">덕수궁</div>
			<div class="introduceTour_content_left"><p>크라운호텔 서울에서 도보로 3~5분 거리에 위치할 정도로 가까운 덕수궁에는 아름다운 정원과 국립현대미술관이 있습니다. 조선의 고종황제가 승하한 곳이며, 아관파천 등 한국의 역사가 담긴 곳입니다. 덕수궁 돌담길의 풍경이 멋져 가을의 운치를 느끼기에 좋습니다. 지하철 1호선, 2호선 시청역과 서울시립미술관이 인접해 있습니다.
														<br/><br/><p>이동 소요 시간 : 서울시청 방향 도보 3~5분 이내</p>
														<br/><br/><a href="http://www.deoksugung.go.kr/" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg3.jpg" class="introduceTour_img_left">
			<div class=introduceTour_subject_right>창덕궁</div>
			<div class="introduceTour_content_right"><p>크라운호텔 롯데호텔 서울에서 차로 5~10분 거리에 위치한 창덕궁에는 세계문화유산으로 지정된 후원(비원)이 있습니다. 빼어난 자연관광을 자랑하는 곳으로서 사계절의 다양한 경치와 함께 해설사의 재미있는 가이드 또한 즐기실 수 있는 곳입니다.
														<br/><br/><p>이동 소요 시간 : 인사동 방향 차로 5~10분 이내</p>
														<br/><br/><a href="http://www.cdg.go.kr/default.jsp" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg4.jpg" class="introduceTour_img_right">
			<div class="introduceTour_subject_left">운현궁</div>
			<div class="introduceTour_content_left"><p>운현궁은 현재 종로구 운니동에 위치한 사적 제 257호의 문화유산입니다. 운현궁은 경복궁과 같은 궁궐이 아니라 왕족의 친족들이 거주하던 곳을 궁(宮)으로 부른 것 중의 하나이며, 궁(宮)은 생활의 공간, 궐(闕)은 정치의 공간으로서 경복궁이 정치와 궁중생활이 함께 이루어진 곳이었다면, 운현궁은 왕족의 친족인 흥선대원군의 일가가 거주하고 생활하던 공간입니다. 그러나 운현궁은 조선조 말기의 역사적 사건들 대부분이 시작된 곳이며 수많은 개혁정책과 쇄국정책이 시행된 곳이었기에 그 역사적 상징성은 남다르다고 할 수 있습니다.
														
														<br/><br/><a href="http://www.unhyeongung.or.kr/" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/><br/>
			<hr/>
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg5.jpg" class="introduceTour_img_left">
			<div class=introduceTour_subject_right>종묘</div>
			<div class="introduceTour_content_right"><p>크라운호텔 롯데호텔 서울에서 차로 5~10분 거리에 위치한 종묘는 역대 왕과 왕비의 제를 모시는 곳으로 제사, 궁궐 음악 등을 감상하실 수 있는 곳입니다. 1호선, 3호선 종로3가역에 인접해 있으며 종로 귀금속 거리, 세운전자 상가가 있어 관광하는 재미가 있는 곳입니다
														<br/><br/><p>이동 소요 시간 : 청계천 방향 차로 5~10분 이내</p>
														<br/><br/><a href="https://jm.cha.go.kr/agapp/main/index.do?siteCd=JM" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<div>
			<div id="introduceTourHistoryAdd">역사 주요명소 더 보기</div>
			<div id="introduceTourMaul"><p class="introduceTour_history_text">한옥마을</p><a href="#" class="introduceTour_atag_look"><p class="introduceTour_look">자세히 보기></p></a></p></div>
			<div id="introduceTourMuseum"><p class="introduceTour_history_text">박물관</p><a href="#" class="introduceTour_atag_look"><p class="introduceTour_look">자세히 보기></p></a></p></div>
			</div>
		

		</div>


		<div id="tab2" class="tabcontent">
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg6.jpg" class="introduceTour_img_left">
			<div class=introduceTour_subject_right2>북촌한옥마을</div>
			<div class="introduceTour_content_right"><p>크라운호텔 롯데호텔 서울에서 차로 5~10분 정도 이동하면 도착하는 한옥마을입니다. 전통적인 풍경이 잘 보존된 한옥마을은 사진 찍기 좋은 북촌 8경을 포함해 작은 상점이나 레스토랑 구석구석을 찾는 재미가 있는 곳입니다. 북촌한옥마을은 삼청동과 인접해 있으며 한국 전통문화를 접할 수 있는 곳입니다.
														<br/><br/><p>이동 소요 시간 : 삼청동 방향 차로 5~10분 이내</p>
														<br/><br/><a href="http://hanok.seoul.go.kr/front/index.do" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg7.jpg" class="introduceTour_img_right">
			<div class="introduceTour_subject_left">남산골 한옥마을</div>
			<div class="introduceTour_content_left"><p>한옥 5개 동과 전통 정원으로 이뤄진 남산골 한옥마을은 롯데호텔 서울에서 택시로 5~10분 내에 이동할 수 있으며, 한국의 옛 양반 가옥을 감상하며 다양한 놀이 또는 직접 체험하실 수 있습니다.
														<br/><br/><p>이동 소요 시간 : 충무로 방향 차로 5~10분</p>
														<br/><br/><a href="http://hanok.seoul.go.kr/front/index.do" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/><br/><br/>
			<hr/>
			
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg8.jpg" class="introduceTour_img_left">
			<div class=introduceTour_subject_right>삼청동</div>
			<div class="introduceTour_content_right"><p>크라운호텔 서울에서 10여 분 걸어가면 도착할 수 있으며, 광화문 광장이나 청와대와 가깝습니다. 우리나라 대표 고궁인 경복궁은 왕의 집무실, 태후화 황후의 예쁜 궁궐과 정원, 연회를 열던 경회루 등이 있습니다. 때때로 야간개장을 하기도 하여 낮과 밤이 모두 아름다운 고궁입니다. 경복궁에서 진행되는 수문장 교대 의식 또한 관광객에게 인기가 많습니다. 근처에서 국립민속박물관, 국립현대미술관 서울, 국립고궁박물관 등을 둘러보실 수 있으며, 경복궁은 3호선 경복궁역이나 5호선 광화문역을 통해 가실 수 있습니다.
														<br/><br/><p>이동 소요 시간 : 광화문 광장 방향 도보 10분이내</p>
														<br/><br/><a href="http://korean.visitseoul.net/attractions/%EC%82%BC%EC%B2%AD%EB%8F%99-%EA%B3%A8%EB%AA%A9%EA%B8%B8_/2121" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			
			<div>
			<div id="introduceTourHistoryAdd">역사 주요명소 더 보기</div>
			<div id="introduceTourMaul"><p class="introduceTour_history_text">고궁</p><a href="#" class="introduceTour_atag_look"><p class="introduceTour_look">자세히 보기></p></a></p></div>
			<div id="introduceTourMuseum"><p class="introduceTour_history_text">박물관</p><a href="#" class="introduceTour_atag_look"><p class="introduceTour_look">자세히 보기></p></a></p></div>
			</div>
		</div><!-- tab2 -->

		<div id="tab3" class="tabcontent">
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg9.jpg" class="introduceTour_img_left">
			<div class=introduceTour_subject_right2>국립중앙박물관</div>
			<div class="introduceTour_content_right"><p>차로 10여 분 거리에 지하철 이촌역과 인접한 국립중앙박물관이 있습니다.
														고조선부터 시작되는 한국의 역사와 의미 있는 기념품으로 국립중앙박물관에서 한국의 깊은 역사를 체험해보시기 바랍니다.
														<br/><br/><p>이동 소요 시간 : 삼청동 방향 차로 5~10분 이내</p>
														<br/><br/><a href="https://www.museum.go.kr/site/main/home" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			<br/><br/>
			<hr/>
			
			<div>
			<img src="<%=request.getContextPath()%>/img/introduceTourImg10.jpg" class="introduceTour_img_right3">
			<div class="introduceTour_subject_left">전쟁기념관</div>
			<div class="introduceTour_content_left"><p>전쟁기념관은 차로 롯데호텔에서 10~15분 거리에 있는 삼각지역에 인접합니다. 한국분단의 아픔을 느낄 수 있는 공간이기도 합니다.
														<br/><br/><p>이동 소요 시간 : 충무로 방향 차로 5~10분</p>
														<br/><br/><a href="https://www.warmemo.or.kr/front/main.do;jsessionid=464D47420F48D771CE0589E15E1E18BC" class="introduceTour_atag_look"><p>홈페이지 바로가기></p></a></p></div>
			</div>
			
			<div>
			<div id="introduceTourHistoryAdd">역사 주요명소 더 보기</div>
			<div id="introduceTourMaul"><p class="introduceTour_history_text">고궁</p><a href="#" class="introduceTour_atag_look"><p class="introduceTour_look">자세히 보기></p></a></p></div>
			<div id="introduceTourMuseum"><p class="introduceTour_history_text">한옥마을</p><a href="#" class="introduceTour_atag_look"><p class="introduceTour_look">자세히 보기></p></a></p></div>
			</div>
		
		
		
		
		
			
		</div><!-- tab2 -->
		</div><!-- 이미지,텍스트 --><!-- 두번쨰,세번쨰 탭 메뉴 보이기-->
		
	</div><!-- 메뉴 탭 -->
  </div><!-- 메인센터 -->

</div><!-- 전체div -->	
</section>	
</body>
</html>

