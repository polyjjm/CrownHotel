<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section>
	<div id="roomContainer">
		<!-- 홈 바로가기 -->
		<div class="r_sub_container" >
			<div class="r_inner">
				<div id="rLoc">
            		<span><a href="<%=ctx%>/">홈</a></span>
		            <span><a href="<%=ctx%>/diningMain"> 다이닝</a></span>
		            <span> 레스토랑 - 피에르 가니에르 서울</span>
		        </div>
			</div>
		</div><!-- 홈 바로가기 -->
		
		<!-- 헤드라인 -->
		<div class="r_sub_container">
			<div class="r_inner">
				<div class="r_type_box">
					<p class="r_tpye">레스토랑</p>
				</div>
				<div class="r_title_box">
					<h1 class="r_title">피에르 가니에르 서울</h1>
				</div>
			</div>
		</div><!-- 헤드라인 -->
		
		<!-- 메인 이미지 슬라이더 -->
		<div class="r_sub_container">
			<div class="r_slide_wrap">
				<div class="r_slide_box">
					<!-- img -->
					<div class="r_slick_slider">
						<img src="<%=ctx %>/img/diningMain1.jpg"/>
					</div>
					<div class="r_slick_slider">
						<img src="<%=ctx %>/img/diningMain2.jpg"/>
					</div>
					<div class="r_slick_slider">
						<img src="<%=ctx %>/img/diningMain3.jpg"/>
					</div>
					<div class="r_slick_slider">
						<img src="<%=ctx %>/img/diningMain4.jpg"/>
					</div>
					<div class="r_slick_slider">
						<img src="<%=ctx %>/img/diningMain5.jpg"/>
					</div>
				</div>
				<!-- 슬라이드 버튼 -->
				<div class="r_slider_prev"><img src="<%=ctx%>/img/l1.png"/></div>
				<div class="r_slider_next"><img src="<%=ctx%>/img/r1.png"/></div>
			</div>
		</div><!-- 메인 이미지 슬라이더 -->
		
		<!-- 다이닝 설명 -->
		<div class="r_sub_container">
			<div class="r_inner">
				
				<div class="r_desc">
					<p>※미쉐린 가이드 서울 2020 1스타 선정<br/>
						※미쉐린 가이드 서울 2020 포크&스푼 4개 선정</p><br/>
        			<p class="r_desc_text">크라운호텔 서울 Executive Tower 35층에 위치한 “피에르 가니에르 서울’은 성공적인 비즈니스를 위한 One Hour 서비스와 Contemporary French의 공간입니다. 차별화된 감각의 인테리어와 북한산과 서울 시내가 한눈에 들어오는 환상적인 전망을 경험해 보시기 바랍니다.</p>
    			</div>
    			
    			<!-- 다이닝 개요 -->
				<div class="r_desc_inner">
					<h2 class="r_type_info_title">다이닝 개요</h2>
					<div class="r_type_info_content">
						<ul class="r_type_content_col">
							<li class="r_type_content_item">
								<div class="r_type_content_title">타입</div>
								<div class="r_type_content_text">프엔치</div>
							</li>
							<li class="r_type_content_item">
								<div class="r_type_content_title">위치</div>
								<div class="r_type_content_text">EXECUTIVE TOWER 35층</div>
							</li>
						</ul>
						<ul class="r_type_content_col">
							<li class="r_type_content_item">
								<div class="r_type_content_title"><img src="<%=ctx%>/img/diningMain6.jpg" style="border:1px solid #E6E6E6;margin-left:100px"/></div>
							</li>
						</ul>
					</div>
				</div><!-- 다이닝 개요 -->
				
			
				<div class="r_desc_inner">
					<h2 class="r_type_info_title">이용시간</h2>
					<div class="r_type_info_content">
						
						<div class="r_amenities_item">
						
							<div class="r_item_list">
								<ul>
			                        <li>점심 12:00 ~ 15:00 (L.O 14:00)</li><br/>
									<li>저녁 18:00 ~ 22:00 (L.O 21:00)</li>
									
	                    		</ul>
							</div>
						</div>
						
					
					
					
					</div>
				</div>
				
				<!-- 추가정보 -->
				<div class="r_desc_inner">
					<h2 class="r_type_info_title">추가정보</h2>
					<div class="r_type_info_content">
						<ul>
	                        <li id="rHelp">• 연중 상시 무료 발렛파킹 서비스 제공</li>
	                        <li id="rInterpunct">• 드레스코드: 스마트캐주얼 또는 비즈니스캐주얼로 남성분의 경우에는 옷깃이 있는 셔츠와 긴 바지 착용을 부탁드립니다. 찢어진 청바지와 트레이닝 복, 모자, 슬리퍼 착용 시 불가피하게 입장에 제한이 있을 수 있습니다.</li>
                		</ul>
					</div>
				</div><!-- 추가정보 -->
				
				<!-- 피에르 소개-->
				<div class="r_desc_inner">
					<h2 class="r_type_info_title">피에르 가니에르 소개</h2>
					<div class="r_type_info_content">
						<ul>
	                        <li id="rHelp"><img src="<%=ctx%>/img/diningMain7.jpg" style="width:420px;height:235px"/></li>
	                        <li id="rInterpunct">미식가들의 천국이라고 불리는 파리 중심에 위치한 호텔
												발자크 (Hotel Balzac)에 자신의 레스토랑인 PIERRE GAGNAIRE를
												오픈(1997)한 피에르 가니에르의 창조적이고 혁신적인 요리
												스타일이 미식가와 평론가들로부터 호응을 얻으면서 세계
												적인 스타 셰프로 명성을 얻게 되며, 1년 후인 1998년 레스토랑
												PIERRE GAGNAIRE는 세계 최고 레스토랑에게 주어지는 미쉐린
												3스타 레스토랑의 영예를 획득하게 된다.</li>
                		</ul>
					</div>
				</div><!-- 피에르소개 -->
				
				<!-- 대표메뉴 -->
				<div class="r_desc_inner">
					<h2 class="r_type_info_title">대표메뉴</h2>
					<div class="r_type_info_content">
						<ul>
	                        <li id="rHelp"><h4>피에르 가니에르 요리</h4></li>
	                        <li id="rInterpunct">혁신적인 실험정신과 예술적 감각으로 재 탄생한 정통 프렌치 요리<br/>
					신이 즐기는 요리, 요리계의 피카소, 식탁의 시인 등 경의에 가까운 찬사를 받으며 프랑스 요리의 지존으로 칭송받는 피에르 가니<br/>에르
 				(Pierre Gagnaire)는 식재료의 조직과 질감을 과학적 분석을 통해 다양한 조리법을 개발하여 이를 바탕으로 한 선과 색을 살린 예술적 감각의 독창적인 요리를 선보이고 있습니다.
				<br/><br/>
				[ LUNCH MENU ]<br/>
				￦90,000 ~ ￦140,000
				<br/><br/>
				[ DINNER MENU ]<br/>
				￦170,000 ~ ￦340,000<br/><br/>

				모든 메뉴 가격은 원화이며, 봉사료와 세금이 포함되어 있습니다.</li><br/>
                			<li id="rHelp"><img src="<%=ctx%>/img/diningMain8.jpg" style="width:230px;height:130px;float:left"/></li>
                			<li id="rHelp"><img src="<%=ctx%>/img/diningMain9.jpg" style="width:230px;height:130px;float:left"/></li>
                			<li id="rHelp"><img src="<%=ctx%>/img/diningMain10.jpg" style="width:230px;height:130px;float:left"/></li>
                			<li id="rHelp"><img src="<%=ctx%>/img/diningMain11.jpg" style="width:230px;height:130px;float:left"/></li>
                		</ul>
					</div>
				</div><!-- 대표메뉴 -->
				
				
				<!-- 갤러리 -->
				<div class="r_desc_inner">
					<h2 class="r_type_info_title">갤러리</h2>
					<div class="r_type_info_content">
						<ul>
	                        
	                     	
                			<li id="rHelp"><img src="<%=ctx%>/img/diningMain15.jpg" style="width:230px;height:130px;float:left"/></li>
                			<li id="rHelp"><img src="<%=ctx%>/img/diningMain16.jpg" style="width:230px;height:130px;float:left"/></li>
                			<li id="rHelp"><img src="<%=ctx%>/img/diningMain17.jpg" style="width:230px;height:130px;float:left"/></li>
                			<li id="rHelp"><img src="<%=ctx%>/img/diningMain18.jpg" style="width:230px;height:130px;float:left"/></li>
                		</ul>
					</div>
				</div><!-- 갤러리 -->
				
				<!-- 객실예약 문의 -->
				<div class="r_inquiries_inner">
					<h2 class="r_type_info_title">문의안내</h2>
					<div class="r_type_info_content">
						<div id="r_tel">
							<span>TEL</span>
							<span>+82-2-317-7181/7182</span>
						</div>
						
					</div>
				</div><!-- 객실예약 문의 -->
				
			</div>
		</div><!-- 객실 설명 -->
		
	</div><!-- roomContainer -->
</section>