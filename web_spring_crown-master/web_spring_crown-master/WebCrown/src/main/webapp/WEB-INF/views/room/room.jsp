<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section>
	<div id="roomContainer">
		<!-- 홈 바로가기 -->
		<div class="r_sub_container" >
			<div class="r_inner">
				<div id="rLoc">
            		<span><a href="<%=ctx%>/">홈</a></span>
		            <span><a href="<%=ctx%>/roomMain">객실</a></span>
		            <span>${vo.room_type}</span>
		        </div>
			</div>
		</div><!-- 홈 바로가기 -->
		
		<!-- 헤드라인 -->
		<div class="r_sub_container">
			<div class="r_inner">
				<div class="r_type_box">
					<c:if test="${vo.room_type=='스탠다드'}">
						<p class="r_tpye">STANDARD</p>
					</c:if>
					<c:if test="${vo.room_type=='클럽 플로어'}">
						<p class="r_tpye">CLUB FLOOR</p>
					</c:if>
					<c:if test="${vo.room_type=='스위트'}">
						<p class="r_tpye">SUITE</p>
					</c:if>
				</div>
				<div class="r_title_box">
					<h1 class="r_title">${vo.room_name }</h1>
				</div>
			</div>
		</div><!-- 헤드라인 -->
		
		<!-- 메인 이미지 슬라이더 -->
		<div class="r_sub_container">
			<div class="r_slide_wrap">
				<div class="r_slide_box">
					<!-- img -->
					<c:forEach var="img" items="${vo.roomImgList}">
						<div class="r_slick_slider">
							<img src="<%=ctx %>/upload/${img}"/>
						</div>
					</c:forEach>
					<c:if test="${vo.img == null}">
						<div class="r_slick_slider">
							<img src="<%=ctx %>/img/no-img.jpg"/>
						</div>
					</c:if>
					
				
				</div>
				<!-- 슬라이드 버튼 -->
				<div class="r_slider_prev"><img src="<%=ctx%>/img/l1.png"/></div>
				<div class="r_slider_next"><img src="<%=ctx%>/img/r1.png"/></div>
				
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
				
				
			</div>
		</div><!-- 메인 이미지 슬라이더 -->
		
		<!-- 객실 설명 -->
		<div class="r_sub_container">
			<div class="r_inner">
				
				<div class="r_desc">
        			<p class="r_desc_text">${vo.room_mdsp}</p>
    			</div>
    			
    			<!-- 객실 개요 -->
				<div class="r_desc_inner">
					<h2 class="r_type_info_title">객실 개요</h2>
					<div class="r_type_info_content">
						<ul class="r_type_content_col">
							<li class="r_type_content_item">
								<div class="r_type_content_title">위치</div>
								<div class="r_type_content_text">CROWN HOTEL</div>
							</li>
							<li class="r_type_content_item">
								<div class="r_type_content_title">침대타입</div>
								<div class="r_type_content_text">더블/트윈</div>
							</li>
						</ul>
						<ul class="r_type_content_col">
							<li class="r_type_content_item">
								<div class="r_type_content_title">투숙인원</div>
								<div class="r_type_content_text">2~3명</div>
							</li>
							<li class="r_type_content_item">
								<div class="r_type_content_title">전망</div>
								<div class="r_type_content_text">시티뷰</div>
							</li>
						</ul>
						<ul class="r_type_content_col">
							<li class="r_type_content_item">
								<div class="r_type_content_title">객실면적</div>
								<div class="r_type_content_text">${vo.room_area}㎡</div>
							</li>
							<li class="r_type_content_item">
								<div class="r_type_content_title">체크인/체크아웃</div>
								<div class="r_type_content_text">15:00/12:00</div>
							</li>
						</ul>
					</div>
				</div><!-- 객실 개요 -->
				
				<!-- 어메니티 -->
				<div class="r_desc_inner">
					<h2 class="r_type_info_title">어메니티</h2>
					<div class="r_type_info_content">
						<!-- 어메니티 아이템 -->
						<div class="r_amenities_item">
							<div class="r_item_title">일반</div>
							<div class="r_item_list">
								<ul>
									<c:if test="${vo.chkBoxGen_01 != null && vo.chkBoxGen_01=='40”LED TV'}">
										<li>40”LED TV</li>
									</c:if>
			                        <c:if test="${vo.chkBoxGen_02 != null && vo.chkBoxGen_02=='슬리퍼'}">
										<li>슬리퍼</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_03 != null && vo.chkBoxGen_03=='손전등'}">
										<li>손전등</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_04 != null && vo.chkBoxGen_04=='전화기'}">
										<li>전화기</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_05 != null && vo.chkBoxGen_05=='티포트'}">
										<li>티포트</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_06 != null && vo.chkBoxGen_06=='금고'}">
										<li>금고</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_07 != null && vo.chkBoxGen_07=='구둣주걱'}">
										<li>구둣주걱</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_08 != null && vo.chkBoxGen_08=='구두클리너'}">
										<li>구두클리너</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_09 != null && vo.chkBoxGen_09=='미니바'}">
										<li>미니바</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_10 != null && vo.chkBoxGen_10=='55”LCD TV'}">
										<li>55”LCD TV</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_11 != null && vo.chkBoxGen_11=='빔프로젝터'}">
										<li>빔프로젝터</li>
									</c:if>
									<c:if test="${vo.chkBoxGen_12 != null && vo.chkBoxGen_12=='55”UHD TV'}">
										<li>55”UHD TV</li>
									</c:if>
	                    		</ul>
							</div>
						</div>
						<!-- 어메니티 아이템 -->
						<div class="r_amenities_item">
							<div class="r_item_title">욕실</div>
							<div class="r_item_list">
								<ul>
									<c:if test="${vo.chkBoxBath_01 != null && vo.chkBoxBath_01=='1회용 칫솔 및 치약'}">
										<li>1회용 칫솔 및 치약</li>
									</c:if>
									<c:if test="${vo.chkBoxBath_02 != null && vo.chkBoxBath_02=='면도기'}">
										<li>면도기</li>
									</c:if>
									<c:if test="${vo.chkBoxBath_03 != null && vo.chkBoxBath_03=='목욕가운'}">
										<li>목욕가운</li>
									</c:if>
									<c:if test="${vo.chkBoxBath_04 != null && vo.chkBoxBath_04=='비데'}">
										<li>비데</li>
									</c:if>
									<c:if test="${vo.chkBoxBath_05 != null && vo.chkBoxBath_05=='헤어드라이어'}">
										<li>헤어드라이어</li>
									</c:if>
									<c:if test="${vo.chkBoxBath_06 != null && vo.chkBoxBath_06=='욕실용품'}">
										<li>욕실용품</li>
									</c:if>
									<c:if test="${vo.chkBoxBath_07 != null && vo.chkBoxBath_07=='(몰튼브라운)'}">
										<li>(몰튼브라운)</li>
									</c:if>
									<c:if test="${vo.chkBoxBath_08 != null && vo.chkBoxBath_08=='월풀(자쿠지)'}">
										<li>월풀(자쿠지)</li>
									</c:if>
									<c:if test="${vo.chkBoxBath_09 != null && vo.chkBoxBath_09=='욕실용품(몰트브라운)'}">
										<li>욕실용품(몰트브라운)</li>
									</c:if>
	                    		</ul>
							</div>
						</div>
						<!-- 어메니티 아이템 -->
						<div class="r_amenities_item">
							<div class="r_item_title">기타</div>
							<div class="r_item_list">
								<ul>
									<c:if test="${vo.chkBoxEtc_01 != null && vo.chkBoxEtc_01=='전용 엘레베이터 운영'}">
										<li>전용 엘레베이터 운영</li>
									</c:if>
									<c:if test="${vo.chkBoxEtc_02 != null && vo.chkBoxEtc_02=='케이블/위성 TV 채널'}">
										<li>케이블/위성 TV 채널</li>
									</c:if>
									<c:if test="${vo.chkBoxEtc_03 != null && vo.chkBoxEtc_03=='무료 생수 1일2병'}">
										<li>무료 생수 1일2병</li>
									</c:if>
									<c:if test="${vo.chkBoxEtc_04 != null && vo.chkBoxEtc_04=='보이스 메일 서비스'}">
										<li>보이스 메일 서비스</li>
									</c:if>
									<c:if test="${vo.chkBoxEtc_05 != null && vo.chkBoxEtc_05=='무료차(TEA) 서비스'}">
										<li>무료차(TEA) 서비스</li>
									</c:if>
									<c:if test="${vo.chkBoxEtc_06 != null && vo.chkBoxEtc_06=='네스프레소 커피머신'}">
										<li>네스프레소 커피머신</li>
									</c:if>
									<c:if test="${vo.chkBoxEtc_07 != null && vo.chkBoxEtc_07=='개인 버틀러 서비스'}">
										<li>개인 버틀러 서비스</li>
									</c:if>
			               		</ul>
							</div>
						</div>
					
					</div>
				</div><!-- 어메니티 -->
				
				<!-- 추가정보 -->
				<div class="r_desc_inner">
					<h2 class="r_type_info_title">추가정보</h2>
					<div class="r_type_info_content">
						<ul>
	                        <li id="rHelp">크라운 호텔의 모든 시설은 전부 금연이오니, 이용에 착오 없으시기 바랍니다.</li>
	                        <li id="rInterpunct">모든 요금에 세금 10%가 부과됩니다.</li>
                		</ul>
					</div>
				</div><!-- 추가정보 -->
				
				<!-- 부가 설명 -->
				<div class="r_desc_sdsp r_desc_text">
					${vo.room_sdsp }
				</div>
				
				<!-- 객실예약 문의 -->
				<div class="r_inquiries_inner">
					<h2 class="r_type_info_title">객실예약문의</h2>
					<div class="r_type_info_content">
						<div id="r_tel">
							<span>TEL</span>
							<span>02-3486-9600</span>
						</div>
						<div id="r_fax">
							<span>FAX</span>
							<span>02-6007-1245</span>
						</div>
					</div>
				</div><!-- 객실예약 문의 -->
				
			</div>
		</div><!-- 객실 설명 -->
		
	</div><!-- roomContainer -->
</section>