<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${result!=null && result=='success'}">
	<script>
		swal( "변경완료" , "비밀번호가 변경되었습니다. 다시 로그인 해주세요." , "success" );
	</script>
</c:if>
<c:if test="${iq_result!=null && iq_result=='success'}">
	<script>
		swal( "문의완료" , "문의가 등록완료 되었습니다." , "success" );
	</script>
</c:if>
<c:if test="${me_result!=null && me_result=='success'}">
	<script>
		swal( "수정완료" , "회원 정보가 수정 되었습니다." , "success" );
	</script>
</c:if>
<c:if test="${wd_result!=null && wd_result=='success'}">
	<script>
		swal( "탈퇴완료" , "탈퇴 완료 되었습니다." , "success" );
	</script>
</c:if>
<script>
$(function(){
	initDate();
});

//현재 시간
function setTimer(){
	var timeStr = "";
	var today = new Date();
	var year = today.getFullYear();//년도
	var month = today.getMonth()+1;//월
	var date = today.getDate(); //날짜
	var h = today.getHours(); //시
	var m = today.getMinutes(); //분
	
	
	var dd=["Sun","Mon","Tues","Wednes","Thurs","Fri","Satur"];
	var d=today.getDay();
	timeStr += year+"-";
	timeStr += month+"-";
	timeStr += date;
	timeStr += "("+dd[d]+")";
	if(h<10){
		timeStr += " 0"+h+" ";
	}else{
		timeStr += " "+h+" ";
	}
	
	if(m<10){
		timeStr += ": 0"+m;
	}else{
		timeStr += ": "+m;
	}
	
	document.getElementById("mSpanTime").innerHTML = timeStr;
}

function initDate(){
    setInterval(setTimer, 2000);
}
</script>


<!-- main body -->
<section>
<!-- 메인 이미지 슬라이더 -->
<div id="mSlideWrap">
	<div id="mslideBox">
		<!-- img -->
		<div class="m_slick_slider">
			<img src="<%=ctx %>/img/61.jpg"/>
		</div>
		<div class="m_slick_slider">
			<img src="<%=ctx %>/img/62.jpg"/>
		</div>
		<div class="m_slick_slider">
			<img src="<%=ctx %>/img/63.jpg"/>
		</div>
	</div>
	<!-- 슬라이드 버튼 -->
	<div id="mSliderLeft"><img src="<%=ctx%>/img/l1.png"/></div>
	<div id="mSliderRight"><img src="<%=ctx%>/img/r1.png"/></div>
	
	<!-- 예약 달력 객실 인원 시작 -->
	<div class="rsv_form_001">
		<div class="rsv_reservation_bar">
			<div class="rsv_001">
			
				<form method="get" action="<%=ctx%>/room_selection">
					<div class="rsv_search_001">
						
						<!-- 호텔명 -->
						<div class="rsv_search_item_001 rsv_hotel_001">
							<strong class="hotel_title_001">호텔명</strong>
							<div class="hotel_name_001">
								<i class="xi-bank"></i>
								<span>크라운 호텔</span>
							</div>
						</div>
						
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
	
	
</div><!-- 메인 이미지 슬라이더 -->


<!-- 메인 컨텐츠 -->
<div id="mContainer">
	
	<!-- 프로모션 -->
	<div class="m_sub_container m_space_top m_space_bottom" >
		<div class="m_inner">
			<h2 class="mH2Title">크라운호텔에서 추천하는 프로모션</h2>
			<div id="mPMore" style="overflow:hidden">
       			<a href="<%=ctx%>/hotelPackage" class="m_a_button">프로모션 더 보기 ></a>
   		 	</div>
	   		<div id="mPWrap">
	   			<!-- 프로모션 아이템 -->
	   			<c:forEach var="apvo" items="${plist}" varStatus="status" begin="1" end="6">
	   			<div class="m_promotion">
	   				<div class="m_promotion_img">
	   					<a href="<%=ctx%>/packageView?pack_code=${apvo.pack_code}">
	   						<img src="upload/${apvo.img}" class="scale"/>
	   					</a>
	   				</div>
	   				<div class="m_promotion_inside">
		   				<p class="m_hotel">크라운호텔</p>
	                    <a href="" class="m_promotion__title">${apvo.pack_name}</a>
	                    <p class="m_promotion_dsp">${apvo.room_type}
						<c:if test="${apvo.chkBoxOp1 != null && apvo.chkBoxOp1=='SUN-FRI ONLY'}">
							| SUN-FRI ONLY 
						</c:if>
						<c:if test="${apvo.chkBoxOp2 != null && apvo.chkBoxOp2=='SAT ONLY'}">
							| SAT ONLY 
						</c:if>
						<c:if test="${apvo.chkBoxOp3 != null && apvo.chkBoxOp3=='조식'}">
							| 조식 
						</c:if>
						<c:if test="${apvo.chkBoxOp4 != null && apvo.chkBoxOp4=='석식'}">
							| 석식 
						</c:if>
						<c:if test="${apvo.chkBoxOp5 != null && apvo.chkBoxOp5=='키즈'}">
							| 키즈 
						</c:if>
						<c:if test="${apvo.chkBoxOp6 != null && apvo.chkBoxOp6=='성인'}">
							| 성인 
						</c:if>
						<c:if test="${apvo.chkBoxOp7 != null && apvo.chkBoxOp7=='시즌'}">
							| 시즌
						</c:if></p>
			            <div class="promotion_date-area">
				            <div class="m_promotion_date">
				                <strong>예약</strong>${apvo.pack_start} ~ ${apvo.pack_end}</div> <!-- 예약 -->
		                </div>
	   				</div>
	   				<div class="m_promotion_price">
		   				<span class="m_promotion_type">PACKAGE</span>   
			            <span class="m_promotion_price_currency">KRW</span>
			            <strong class="m_promotion_price_num"><fmt:formatNumber value="${apvo.pack_price }" pattern="#,###"/> ~</strong>
	   				</div>
	   			</div>
	   			</c:forEach>
	   		</div>	
		</div>
	</div><!-- 프로모션 end-->
	
	<!-- 객실 -->
	<div class="m_sub_container m_space_top m_space_bottom" >
		<div class="m_inner">
			<div id="mRoomContainer">
				<div id="mRoombox">
					<a href="<%=ctx%>/roomMain">
						<!-- 객실이미지 -->
						<div id="mRoomImg"><img src="<%=ctx%>/img/room_d.jpg" class="scale"/></div>
						<!-- 설명 -->
						<div id="mRoomContent">
							<div class="m_text">
		                        <p class="m_title">CROWN HOTEL</p>
		                        <p class="m_desc">Korea’s 5 star best luxury hotel</p>
		                    </div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div><!-- 객실 end-->

	<!-- 호텔 info(소개, 위치, 안내) -->
	<div class="m_sub_container m_space_top m_space_bottom" >
		<div class="m_inner">
			<h2 class="mH2Title">크라운호텔 소개</h2>
			
			<!-- 위치 -->
			<div id="mLocSection">
				<div id="mLocSectionLeft">
					<div id="mLocText">
						<p>한국 최고의 럭셔리 비즈니스호텔인 크라운호텔은 1,015실 규모를 자랑하며 서울 소공동에 자리 잡고 있습니다. 명동, 을지로, 청계천 등 서울의 중심 관광지들로의 접근성이 뛰어나 서울 관광을 위한 최적의 위치를 자랑합니다. 네 개의 세계적인 인테리어 회사들이 참가하여 설계한 독창적인 객실은 최신 트렌드를 반영하고 있으며, 성공적인 비즈니스를 위한 클럽 플로어에서는 품격과 정교함을 경험할 수 있습니다. 또한, 롯데호텔 서울에서는 품격있는 가족모임과 고품격 웨딩, 대규모 국제회의와 비즈니스 행사를 위한 최상의 장소를 제공하고 있으며, 최고급 레스토랑을 갖추고 있어 국빈 등 VIP 고객을 모시기에 최적의 공간을 제공합니다.</p>
					</div>
					<div id="mLocWeather">
						<p id="mWeatherTitle">현지 날씨</p>
						<div id="mWeatherInfo">
							<div id="mWeatherImageBox">

                  			<img id="mWeatherImg" src="<%=ctx %>/img/cloud.png" alt="날씨"/>

                    		</div>
                    		<div id="mWeatherText">
		                        <span id="mSpanTime"></span>
		                        <span id="mSpanWeather">27.9℃(82)℉</span>
		                    </div>
						</div>
					</div>
				</div>
				
				<!-- 지도 -->
				<div id="mLocSectionRight">
					<div id="mLocMap" style="width:100%;margin-top:0px">
					</div>
				</div>
				<!-- <div id="mLocSectionRight">
					<div id="mLocMap"></div>
				</div> -->
			</div><!-- 위치 end -->
			
      <!-- 안내 -->
			<div id="mInfo">
		        <div id="mInfoTime">
		            <p>체크인 15:00</p>
		            <p>체크아웃 12:00</p>
		        </div>
		        <div id="mInfoTel">
	                <p>
	                    <span>대표번호 : +82-2-71-1000</span>
	                </p>
	                <p>
	                    <span>객실 예약 : +82-2-759-7311~5</span>
	                </p>
	                <p >팩스 : +82-2-773-4910</p>
		        </div>
		        <div id="mInfoRoom">
		            <p>객실 : 1,015</p>
		            <p>레스토랑 &amp; 바 : 7</p>
		        </div>
		        <div id="mInfoFacilities">
		            <p>대표 부대시설 : 미팅룸, &nbsp;레스토랑,&nbsp;스파,온천,&nbsp;수영장,&nbsp;피트니스,             
		            &nbsp;클럽라운지,&nbsp;비즈니스 센터, &nbsp;골프
		            </p>
		        </div>
			</div><!-- 안내  end-->
		</div><!-- m_inner -->
	</div><!-- 호텔 info(소개, 위치, 안내) end -->
	
</div><!-- 메인 컨텐츠 end -->
</section>


