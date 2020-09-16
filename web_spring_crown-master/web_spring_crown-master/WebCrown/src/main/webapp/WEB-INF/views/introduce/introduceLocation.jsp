<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	$(function(){
		initMap();
	
	});
	
</script>

<section>
<div id="introduceLocationCenter">
	<!-- 맨위 상단 홈  -->
	<div id="introduceLocationBar">
	 	<span class="introduceLocation_home">홈</span> / <span class="introduceLocation_home">크라운 호텔 소개</span> / <span class="introduceLocation_home">크라운호텔 위치</span>
	</div>
	<!-- 메인 센터 -->
	<div>
		<div id="introduceLocationName">크라운 호텔 위치</div>
		<!-- 지도 표시할 곳 -->
		<div id="gMap"></div>
		<!-- 연락처, 팩스 -->
		<div id="introduceLocationTelFax">
			<div id="introduceLocationCrownHotel">크라운 호텔 서울</div><div id="introduceLocationLocation">서울특별시 중구 을지로 30 크라운호텔 서울</div>
			<div id="introduceLocationTel"><b>TEL</b> +82-2-771-1000</div><div id="introduceLocationFax"><b>FAX</b> +82-2-773-4910</div>
		</div><!-- 연락처, 팩스 -->
		<!-- 도보 -->
		<div>
			<div id="introduceLocationFoot">도보</div>
		</div>
		<!-- 도보,주변,주요 관광지,빌딩 -->
		<div>
			<table id="introduceLocationTableFoot"><!-- 구글에 divtable 사이트 참조 -->
				<tbody>
				<tr>
				<th class="introduceLocationBoder1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th class="introduceLocationBoder1">주변 관광지</th>
				<th class="introduceLocationBoder1">주요 빌딩</th>
				<th class="introduceLocationBoder1">주요 관공서</th>
				</tr>
				<tr>
				<th class="introduceLocationBoder1">5분</th>
				<td class="introduceLocationBoder1">면세점 /크라운백화점 / 덕수궁 / 명동쇼핑거리 / 시청광장 / 그레뱅뮤지엄 / 환구단 </td>
				<td class="introduceLocationBoder1">SKT타워 / 미래에셋 센터원 / 페럼타워 / 서울파이낸스센터 </td>
				<td class="introduceLocationBoder1">서울시청 / 국제교류재단</td>
				</tr>
				<tr>
				<th class="introduceLocationBoder1">7분</th>
				<td class="introduceLocationBoder1">종각젊음의 거리 / 청계천 / 명동난타극장 / 명동성당	</td>
				<td class="introduceLocationBoder1">영풍빌딩</td>
				<td class="introduceLocationBoder1">-</td>
				</tr>
				<tr>
				<th class="introduceLocationBoder1">10분</th>
				<td class="introduceLocationBoder1">서울시립미술관 / 정동극장 / 보신각</td>
				<td class="introduceLocationBoder1">포스트타워 / 한국은행 / 종로타워 / 그랑서울 / 디타워 / 시그니처타워 / 파인에비뉴 / SC빌딩 / 부영태평빌딩</td>
				<td class="introduceLocationBoder1">예금보험공사 / 한국관광공사 / 서울센터 / 정부종합청사(외교부, 통일부)</td>
				</tr>
				<tr>
				<th class="introduceLocationBoder1">15분</th>
				<td class="introduceLocationBoder1">숭례문 / 남대문시장 / 광화문광장 / 대한민국역사박물관 / 조계사 </td>
				<td class="introduceLocationBoder1">스테이트타워남산 / 대연각타워 / 교보생명빌딩 / 대한상공회의소 </td>
				<td class="introduceLocationBoder1">-</td>
				</tr>
				</tbody>
			</table>
		</div><!-- 도보,주변,주요 관광지,빌딩 -->
		
		<!-- 자동차 -->
		<div>
			<div id="introduceLocationCar">자동차</div>
			<div>(실제 소요시간은 교통상황에 따라 달라질 수 있습니다.)</div>
		</div>
		<!-- 자동차,주변,주요 관광지,빌딩 -->
		<div>
			<table id="introduceLocationTableCar">
				<tbody>
				<tr>
				<th class="introduceLocationBoder1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th class="introduceLocationBoder1">주변 관광지</th>
				<th class="introduceLocationBoder1">주요 빌딩</th>
				<th class="introduceLocationBoder1">주요 관공서</th>
				</tr>
				<tr>
				<th class="introduceLocationBoder1">5분</th>
				<td class="introduceLocationBoder1">종각 젊음의 거리</td>
				<td class="introduceLocationBoder1">영풍빌딩 / S타워 </td>
				<td class="introduceLocationBoder1">-</td>
				</tr>
				<tr>
				<th class="introduceLocationBoder1">10분</th>
				<td class="introduceLocationBoder1">경복궁 / 경희궁 / 남산골한옥마을 / 한국의 집 / 인사동 / 광장시장 / 운현궁 / 조계사 / 세종문화회관 / 서울역사박물관 / 국립민속박물관 / 통인시장</td>
				<td class="introduceLocationBoder1">스테이트타워 남산 / 대연각타워 / 교보타워 / 종로타워 / 한국은행 / 포스트타워 / 그랑서울 / 디타워 / 시그니처타워 / 파인에비뉴 / SC빌딩 / 부영태평빌딩 / 오피시아 광화문 / 흥국생명빌딩 / 서울스퀘어 / 대한상공회의소 </td>
				<td class="introduceLocationBoder1">정부총합청사(외교부, 통일부 등) / 청와대</td>
				</tr>
				<tr>
				<th class="introduceLocationBoder1">15분</th>
				<td class="introduceLocationBoder1">청와대 / 창덕궁 / 창경궁 / 종묘 / N서울타워 / 삼청동 / 북촌한옥마을 / 동대문디자인플라자 / 흥인지문 / 동대문종합시장 / 문화역서울284 / 서울로7017 / 이태원 </td>
				<td class="introduceLocationBoder1">-</td>
				<td class="introduceLocationBoder1">-</td>
				</tr>
				</tbody>
			</table>
		</div><!-- 자동차,주변,주요 관광지,빌딩 -->
		<!-- 오시는길(아코디언) -->
		<hr style="border-color:black"/>
		<div>
		
		<div class="accordion-box">	
		<ul>
			<li>
				<p class="title my-2">
					<span class="introduceLocationWay">자동차로 오시는길</span>
				</p>
				<div class="answer rounded-lg" style="width:1280px;background:#FAFAFA" >
				
														<p><b>광화문 방면</b></p>

														<p>시청 앞 사거리를 지나 남대문 앞에서 U턴 → 시청 방향으로 다시 오다가 한화손해보험 빌딩 전에서 북창동길로 우회전 →<br/>
														조선호텔 앞에서 을지로 방향으로 좌회전 → 시청광장 옆에서 우회전 →약 50미터 직진 후 크라운호텔 주차장으로 진입</p>
														
														<p><b>신촌/서소문</b></p>
														
														<p>시청 앞 사거리에서 북창동길로 직진(좌회전하면 광화문 방향) →<br/>
														조선호텔 앞에서 을지로 방향으로 좌회전 → 시청 광장 옆에서 우회전 →약 50미터 직진 후 크라운호텔 주차장으로 진입</p>
														
														<p><b>경부고속도로</b></p>
														
														<p>경부고속도로 종점에서 직진하여 한남대교 횡단 → 횡단 후 고가로 진입 → 남산 1호터널 고가도로 진입 →<br/>
														1호터널 통과 후 첫번째 사거리에서 직진 → 2번째 사거리(을지로2가) 에서 시청방향으로 좌회전 →<br/>
														약 100 미터 직진 후(3~4차선 이용)영프라자 앞에서 우회전 →약50미터 직진 후 롯데 백화점 주차장 진입(크라운 백화점과 호텔은 동일한 주차장 이용)</p>
														
														<p><b>남산 3호 터널</b></p>
														<p>남산 3호 터널을 지나 한국은행 사거리로 직진 → 시청, 광화문 방면으로 350미터 오다가 시청광장에서 우회전 →<br/>약 50미터 직진 후 크라운호텔 주차장 진입</p>
														
														<p><b>을지로 2가</b></p>
														
														<p>을지로 입구(1가) 사거리에서 한국은행 방면으로 좌회전 →
														크라운백화점 지나 영프라자 입구에서 우회전 → <br/>약 50미터 직진 후 롯데 백화점 주차장으로 진입(크라운 백화점과 호텔은 동일한 주차장 이용)</p>
				</div>
			</li>
		</ul>			
		</div>
		<hr/>
		<div class="accordion-box">	
		<ul>
			<li>
				<p class="title my-2">
					<span class="introduceLocationWay">지하철로 오시는길</span>
				</p>
				<div class="answer rounded-lg" style="width:1080px;background:#FAFAFA" >
													<p><b>1호선 시청역</b></p>
													
													<p>- 지하철 출구: 5번 출구
													- 도보 10분</p>
													
													<p><b>2호선 을지로 입구역</b></p>
													
													<p>- 지하철 출구: 8번 출구
													- 도보 1분</p>
				</div>
			</li>
		</ul>			
		</div>
		<hr/>
		<div class="accordion-box">	
		<ul>
			<li>
				<p class="title my-2">
					<span class="introduceLocationWay">버스로 오시는길</span>
				</p>
				<div class="answer rounded-lg" style="width:1080px;background:#FAFAFA" >
									<p><b>크라운 백화점 앞</b></p>
									
									<p>- 지선(초록) : 7017, 7021<br/>
									- 간선(파랑) : 100, 143, 151, 152, 202, 261, 262, 405, 501, 701, 702A, 702B, 705<br/>
									- 간선(심야) : N10, N30, N40</p>
									
									<p><b>크라운 영프라자 앞</b></p>
									
									<p>- 간선(파랑) : 162, 163, 201, 506<br/>
									- 광역(빨강) : 2500, 9701<br/>
									- 직행　　 : 9301<br/>
									- 간선(심야) : N30</p>
									
									<p><b>크라운 영프라자 맞은편 (명동 입구)</b></p>
									
									<p>- 지선(초록) : 7017, 7021, 7022<br/>
									- 간선(파랑) : 100, 103, 105, 143, 151, 152, 162, 163, 201, 202, 261, 262, 401, 406, 408, 500, 504, 701, 704<br/>
									- 간선(심야) : N10, N30</p>
									
									<p><b>명동 국민은행 앞</b></p>
									
									<p>- 광역(빨강) : 7900, 8800, 9401, 9401B, M4101, M4102, M4108, M5107, M5115, M5121<br/>
									- 직행　　　: 1005-1, 1150, 5000, 5005, 5007, 5500, 5500-1, 5500-2, 8100, 9000, 9001, 9003, 9007, 9300, 9301<br/>
									- 공항　　　: 6001, 6015</p>
									
									<p><b>크라운호텔 앞</b></p>
									
									- 공항　　 : 6701
				</div>
			</li>
		</ul>			
		</div>
		<hr/>
		</div>
		
		
	</div><!-- 메인 센터 -->
</div>
</section>
