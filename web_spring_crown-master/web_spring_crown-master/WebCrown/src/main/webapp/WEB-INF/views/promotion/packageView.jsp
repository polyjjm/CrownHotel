<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=ctx %>/css/packageView.css" type="text/css" />
<script>

	$(function(){
		$(".item1").mouseover(function(){
			$(".item1").css("background-color", "white");
		});
		$(".item1").mouseout(function(){
			$(".item1").css("background-color", "#f5f5f5");
		});
		
		$(".item2").mouseover(function(){
			$(".item2").css("background-color", "white");
		});
		$(".item2").mouseout(function(){
			$(".item2").css("background-color", "#f5f5f5");
		});
		
		$(".item3").mouseover(function(){
			$(".item3").css("background-color", "white");
		});
		$(".item3").mouseout(function(){
			$(".item3").css("background-color", "#f5f5f5");
		});
		
		$(document).on('click','#packageTypeBtn',function(){
			if($(".rsv_form_002").css("display")=="none"){
				$(".rsv_form_002").css("display","block");
			}else{
				$(".rsv_form_002").css("display","none");
			}
			
		});
		
		
	});
	
	document.title="호텔 패키지 상세보기 | 크라운 호텔";
</script>
<section>
<div id="mainDiv">
	<div id="title">
		<div id="route">홈&nbsp;&nbsp;/&nbsp;&nbsp;프로모션&nbsp;&nbsp;/&nbsp;&nbsp;호텔 패키지&nbsp;&nbsp;/&nbsp;&nbsp;${apvo.pack_name}</div>
	</div>
	<div id="content">
		<div id="contentTitle">
			<h1>${apvo.pack_name}</h1>
			<c:if test="${apvo.chkBoxOp1 != null && apvo.chkBoxOp1=='SUN-FRI ONLY'}">
				<p>SUN-FRI ONLY</p> 
			</c:if>
			<c:if test="${apvo.chkBoxOp2 != null && apvo.chkBoxOp2=='SAT ONLY'}">
				<p>SAT ONLY</p> 
			</c:if>
			<c:if test="${apvo.chkBoxOp3 != null && apvo.chkBoxOp3=='조식'}">
				<p>조식</p>
			</c:if>
			<c:if test="${apvo.chkBoxOp4 != null && apvo.chkBoxOp4=='석식'}">
				<p>석식</p>
			</c:if>
			<c:if test="${apvo.chkBoxOp5 != null && apvo.chkBoxOp5=='키즈'}">
				<p>키즈</p>
			</c:if>
			<c:if test="${apvo.chkBoxOp6 != null && apvo.chkBoxOp6=='성인'}">
				<p>성인</p> 
			</c:if>
			<c:if test="${apvo.chkBoxOp7 != null && apvo.chkBoxOp7=='시즌'}">
				<p>시즌</p>
			</c:if>
		</div>
		<div id="content">
			<div id="packageContent">
				<img src="upload/${apvo.img}"/>
				<div id="packageInfo">
					<p>${apvo.dsp}</p>
					<div id="packageInfoDetail">
						문의 +82 02-707-1480&nbsp;&nbsp;|&nbsp;&nbsp;
						기간 ${apvo.pack_start}~${apvo.pack_end}
					</div>
				</div>
			</div>
			<div id="packageType">
				<h2>패키지 타입</h2>
				<ul class="type_list">
					<li class="type">
						<div id="typeTitle">
							<strong>PACKAGE | ${apvo.pack_name}</strong>
							<div id="typePrice">
								<span id="krw">KRW</span>
								<span id="price">${apvo.pack_price}~&nbsp;&nbsp;</span>
								<button id="packageTypeBtn">예약하기</button>
							
							
							
								<!-- 예약 달력 객실 인원 시작 -->
								<div class="rsv_form_002">
									<div class="rsv_reservation_bar">
										<div class="rsv_002">
										
											<form method="get" action="<%=ctx%>/room_selection">
												<div class="rsv_search_001">
	
													<!-- 달력선택 -->
													<div class="rsv_search_item_001 rsv_date_001">
														<!-- 형식  : 2020-07-01 name: rsv_check_in rsv_check_out -->
														<input type="hidden" name="rsv_check_in" id="rsv_check_in001" value="${today}"/>
														<input type="hidden" name="rsv_check_out" id="rsv_check_out001" value="${nextDay }"/>
														<!-- 체크인 -->
														<div class="date_col_001">
							                                 <div>
							                                 	<strong class="date_title_001">체크인</strong>
							                                 </div>
							                                 <div class="date_content_001">
							                                 	<div class="date_day_001" id="startDay001">${todate }</div>
							                                 	<div class="date_month_001">
								                                     <span id="startMonth001">${tomon }월</span>
								                                     <br>
								                                     <span id="startWeek001">${toDayOfWeek }요일</span>
							                                 	</div>
							                                 </div>
							                             </div><!-- 체크인 -->
							                             
							                             <!-- 1박 -->
							                             <div class="date_stay_001">
							                             	<div class="date_stay_img"><img src="<%=ctx %>/img/dal.png"/></div>
							                             	<span class="night_001">1</span>박
							                             </div><!-- 1박 -->
							                             
							                             <!-- 체크아웃 -->
							                             <div class="date_col_001">
							                                 <div>
							                                 	<strong class="date_title_001">체크아웃</strong>
							                                 </div>
							                                 <div class="date_content_001">
							                                 	<div class="date_day_001" id="endDay001">${nextday }</div>
							                                 	<div class="date_month_001">
								                                     <span id="endMonth001">${nextmon}월</span>
								                                     <br>
								                                     <span id="endWeek001">${nextDayOfWeek }요일</span>
							                                 	</div>
							                                 </div>
							                             </div><!-- 체크아웃 -->
							                             
													</div><!-- 달력선택 -->
													
													<!-- 객실, 인원 검색 -->
													<div class="rsv_search_item_001 rsv_person_001">
														<!--  -->
														<div class="person_col_001">
															<strong class="person_text_001">객실수</strong>
															<span class="person_num_001" id="sumRoomText001">1</span>
															<input type="hidden" name="rsv_room_count" id="rsv_room_count" value="1"/>
														</div>
														<div class="person_col_001">
															<strong class="person_text_001" >성인</strong>
															<span class="person_num_001" id="sumAdultText001">1</span>
														</div>
														<div class="person_col_001">
															<strong class="person_text_001">어린이</strong>
															<span class="person_num_001" id="sumChildText001">0</span>
														</div>
														
														<div class="search_person_layer_001">
															
															<div class="person_head_001">
																<strong class="person_title_001">객실-투숙인원</strong>
																<div class="person_info_001">
							                                        <span class="person_info_item_001">선택가능 객실 3개</span>
							                                        <span class="person_info_item_001">만4-12세</span>
							                                    </div>
															</div>
															
															<ul class="person_list_001">
							
							                                    <li class="person_item_001">
							                                        <em class="person_subtitle_001">
							                                            <span>객실 1</span>
							                                        </em>
							                                        <!-- 객실 1 -->
							                                        <div class="person_count_001">
							                                            <div class="c-counter_001">
							                                                <button type="button" class="c-counter_button_decrease c-counter_button_disable" disabled><i class="xi-minus-thin"></i></button>
							                                                <input name="rsv_adult" id="rsv_adult" type="hidden" value="1" title="성인">
							                                                <span class="c-counter_view_001" id="view_adult1">성인 1</span>
							                                                <button type="button" class="c-counter_button_increase" ><i class="xi-plus-thin"></i></button>
							                                            </div>
							                                        </div>
							                                        <div class="person_count_001">
							                                            <div class="c-counter_001">
							                                                <button type="button" class="c-counter_button_decrease c-counter_button_disable" disabled><i class="xi-minus-thin"></i></button>
							                                                <input name="rsv_child" id="rsv_child" type="hidden" value="0" title="어린이">
							                                                <span class="c-counter_view_001" id="view_child1">어린이 0</span>
							                                                <button type="button" class="c-counter_button_increase" ><i class="xi-plus-thin"></i></button>
							                                            </div>
							                                        </div>
							                                        <!-- 객실 1 -->
							                                    </li>
							                                    
							                                    <!-- 객실 2 -->
							                                    <li class="person_item_001">
							                                        <em class="person_subtitle_001">
							                                            <span>객실 2</span>
							                                        </em>
							                                        
							                                        <div class="person_count_001">
							                                            <div class="c-counter_001">
							                                                <button type="button" class="c-counter_button_decrease c-counter_button_disable" disabled="disabled"><i class="xi-minus-thin"></i></button>
							                                                <input name="rsv_adult1" id="rsv_adult1" type="hidden" value="0" title="성인">
							                                                <span class="c-counter_view_001" id="view_adult2">성인 0</span>
							                                                <button type="button" class="c-counter_button_increase" ><i class="xi-plus-thin"></i></button>
							                                            </div>
							                                        </div>
							                                        <div class="person_count_001">
							                                            <div class="c-counter_001">
							                                                <button type="button" class="c-counter_button_decrease c-counter_button_disable" disabled="disabled"><i class="xi-minus-thin"></i></button>
							                                                <input name="rsv_child1" id="rsv_child1" type="hidden" value="0" title="성인">
							                                                <span class="c-counter_view_001 c-counter_span_disable" id="view_child2">어린이 0</span>
							                                                <button type="button" class="c-counter_button_increase c-counter_button_disable" disabled="disabled"><i class="xi-plus-thin"></i></button>
							                                            </div>
							                                        </div>
							                                    </li>
							                                    
							                                    <!-- 객실 3 -->
							                                    <li class="person_item_001">
							                                        <em class="person_subtitle_001">
							                                            <span>객실 3</span>
							                                        </em>
							                                        <div class="person_count_001">
							                                            <div class="c-counter_001">
							                                                <button type="button" class="c-counter_button_decrease c-counter_button_disable" disabled="disabled"><i class="xi-minus-thin"></i></button>
							                                                <input name="rsv_adult2" id="rsv_adult2" type="hidden" value="0" title="성인">
							                                                <span class="c-counter_view_001" id="view_adult3">성인 0</span>
							                                                <button type="button" class="c-counter_button_increase" ><i class="xi-plus-thin"></i></button>
							                                            </div>
							                                        </div>
							                                        <div class="person_count_001">
							                                            <div class="c-counter_001">
							                                                <button type="button" class="c-counter_button_decrease c-counter_button_disable" disabled="disabled"><i class="xi-minus-thin"></i></button>
							                                                <input name="rsv_child2" id="rsv_child2" type="hidden" value="0" title="성인">
							                                                <span class="c-counter_view_001 c-counter_span_disable" id="view_child3">어린이 0</span>
							                                                <button type="button" class="c-counter_button_increase c-counter_button_disable" disabled="disabled"><i class="xi-plus-thin"></i></button>
							                                            </div>
							                                        </div>
							                                    </li>
							                                    
							                                </ul>
							
							
															<button type="button" class="search_person_close">
							                             		<i class="xi-close-thin xi-2x"></i>
							                             	</button>
														</div>
													</div><!-- 객실, 인원 검색 -->
													
													<!-- 검색 버튼 -->
													<button type="submit" class="rsv_btn_001">검색</button>
												</div>
											</form>
										
										</div>
									</div>
								</div><!-- 예약 달력 객실 인원 끝-->
							
	
								
							</div>
						</div>
						<div id="typeDetail">
							<div id="typeDetailLeft">
								<strong>패키지 구성</strong>
								<p>
								${apvo.sdsp}
								</p>
							</div>
							<div id="typeDetailRight">
								<strong>기타 세부사항</strong><br/>
								<p>
									• 패키지 이용 금액은 투숙일자 및 객실타입에 따라 달라질 수 있습니다.<br/>
									• 이용하지 않은 패키지의 포함 내역에 대해서는 환불해 드리지 않습니다.<br/>
									• 업그레이드 객실은 한정 수량으로 선착순 마감됩니다.<br/>
									• 성인기준은 14세 이상 (중학생)이며, 어린이 기준은 만4세(49개월)부터 <br/>&nbsp;&nbsp;13세(초등학교6학년)까지입니다.<br/><br/><br/><br/><br/><br/><br/>
									
									- 인원추가불가 (최대 3인 투숙가능)
								</p>
							</div>
						</div>
						<div style="clear:both; height:400px"></div>
					</li>
				</ul>
			</div>
			<div id="packageDetail">
				<h2>패키지 상세설명</h2>
				<ul class="detail_list">
					<li class="detail">
						<div id="detailItem">
							<img src="img/package_test.jpg"/>
							<div id="contentItem">
								<h2>Grand Deluxe Room</h2><br/>
								<div id="itemInfo">
									편안함을 주는 베이지에 골드가 가미된 톤온톤 객실은 어디에서도 경험할 수 없는 안락하면서도 럭셔리한 휴식을 제공합니다.
									<br/><br/>
									<p>
										• 객실면적 38~42 ㎡<br/>
										• 최신 시설과 현대적인 감각의 럭셔리 디자인 (영국 The G.A 설계)<br/>
										• 최상의 숙면을 위한 침대 및 침구류<br/>
										&nbsp;&nbsp;-EGYPT cotton으로 제작된 Gastaldi 침구 (Made in Italy)<br/>
										&nbsp;&nbsp;-슈퍼 프리미엄 베딩시스템 적용(Simmons사 공동개발)<br/>
										• 프랑스의 독창적인 니치 브랜드 딥디크(Diptyque) 어메니티<br/>
										• 전 객실 턴다운 서비스<br/>
										• 서울 도심의 환상적인 전망을 감상<br/>
										• 호텔 모든 객실 초고속 인터넷 무료 제공(유선, 와이파이)<br/>
									</p>
									<div id="itemLink">
										<a href="#"><span>자세히 보기 > </span></a>
									</div>
								</div>
							</div>
						</div>	
					</li>
					<!-- 패키지 상세 정보 -->
					<li class="detail">
						<div id="detailItem">
							<img src="img/guest_svc.jpg"/>
							<div id="contentItem">
								<h2>Guest SVC</h2><br/>
								<div id="itemInfo">
									크라운 호텔에 투숙하는 고객님께 특화 서비스가 별도로 제공됩니다.<br/>체크인부터 투숙까지, 기존과 다른 새로운 경험을 맞이해보세요
									<br/><br/>
									<p>
										• 무료 발렛 서비스<br/>
										투숙기간 내 1객실 당 1대 한정<br/>
										발렛 주차 후 프런트 데스크에서 등록 가능<br/><br/>
										• 퍼스널 체크인<br/>
										체크인 시 웰컴티 제공<br/>
										객실 1:1 에스코트<br/><br/>
										• 무료 다림질 서비스 (투숙기간 내 셔츠 2장 / 09:00~18:00)<br/>
										09:00-15:00 내에 요청시 당일 18시까지<br/>
										15:00-18:00 내에 요청시 익일 15시까지 완료<br/><br/>
										• 매일 에비앙 워터 2병과 캡슐커피 및 티 제공<br/>
									</p>
								</div>
							</div>
						</div>	
					</li>
					<li class="detail">
						<div id="detailItem" style="margin-bottom:30px">
							<img src="img/pit.jpg"/>
							<div id="contentItem">
								<h2>피트니스 및 수영장 혜택</h2><br/>
								<div id="itemInfo">
									<p>
										• 이용가능시설: 실내수영장, 사우나, 피트니스 센터<br/>
										• 이용시간 : 06:00~22:00<br/>
										• 마지막 주 월요일 휴무<br/>
										• 문의 : 02-707-1480<br/><br/><br/>
										- 피트니스 이용 시 개별 운동화를 구비해 주시기 바랍니다.<br/>
										- 17세 이하 고객은 사우나 및 피트니스 센터 출입이 제한됩니다.<br/>
									</p>
								</div>
							</div>
						</div>	
					</li>
					<li class="detail">
						<div id="detailItem">
							<img src="img/concierge.jpg"/>
							<div id="contentItem">
								<h2>e-Concierge</h2><br/>
								<div id="itemInfo">
									크라운 호텔 주변 흥미로운 즐길거리를 찾으시나요? 근처 명소, 레스토랑, 쇼핑, 뷰티, 가족체험 등을 한 눈에 파악해보세요.
									<br/><br/>
									<p>
										• 관광: 청계천 남산타워 고궁<br/>
										• 쇼핑 & 공연: 명동 남대문시장 인사동 롯데타운<br/>
										• 뷰티: 스파 네일 헤어<br/>
										• 레스토랑<br/>
										• 가족체험<br/>
										• 컨셉별 추천 여행지<br/>
									</p>
									<div id="itemLink">
										<a href="#"><span>자세히 보기 > </span></a>
									</div>
								</div>
							</div>
						</div>	
					</li>
				</ul>
			</div>
			<div id="attention">
				<h2>유의사항</h2>
				<div id="attentionContent">
					<p>
						- 모든 금액에 세금 10%, 본사료 10%가 가산됩니다.<br/>
						- 체크인은 15:00이며 체크아웃은 12:00입니다.<br/>
						- 상기 패키지의 금액 및 혜택은 사정상 변경될 수 있습니다.<br/>
						- 상기 패키지는 선착순 조기 마감될 수 있습니다.<br/>
						- 서비스 : 무료생수 1일 2병, 초고속 유/무선 인터넷 무료<br/>
						- 패키지 예약 취소 및 변경은 체크인 1일 전 18:00시 까지 가능하며, 이후 취소 및 변경 시 1박 요금이 위약금으로 부과되오니 이 점 양지해 주시기 바랍니다.<br/>
						- 본 패키지는 트레비 클럽 회원 10% 할인 및 타 상품과 중복 할인 및 쿠폰 사용이 제한됩니다.<br/>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="packageList">
	<a href="/crown/hotelPackage">
		<button>목록</button>
	</a>
</div>
</section>
</body>
</html>