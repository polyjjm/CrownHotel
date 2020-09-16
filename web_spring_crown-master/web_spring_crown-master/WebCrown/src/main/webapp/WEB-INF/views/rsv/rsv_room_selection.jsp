<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>





<section>

	<div id="rsv_room_selection_main">
		<input type="hidden" id="room_count" value="${room_count }" />

		<div>
			<span>홈 / 예약하기 / 객실,요금,옵션선택</span>
		</div>
		
		<br />
		<div id="rsv_room_selection_title">
			<ul>
				<li><a href="/crown/rsv">01 날짜,인원선택</a></li>
				<li>> 02 객실,요금,옵션선택</li>
				<li>> 03 고객정보입력</li>

			</ul>
		</div>

		<br />

		<div id="rsv_hotel">
			<ul>
				<li><img src="/crown/img/parson.png/">${check_in } ~
					${check_out } <input type="hidden" id="chk_in" value="${check_in }" />
					<input type="hidden" id="chk_out" value="${check_out }" /></li>
				<li><img src="/crown/img/time.png/">객실 ${room_count} 성인
					${adult+adult2+adult1 } 어린이 ${child+child1+child2} <input
					type="hidden" id="room_ct" value="${room_count }" /></li>

			</ul>
		</div>

		<div id="rsv_tab_option">
			<a class="order_select" href="#" onclick="return false">상품먼저 선택</a> | <a class= "order_select"href="#" onclick="return false" >객실먼저 선택</a>
			 <select>
				<option>전체</option>
				<option>멤버쉽 전용상품</option>
				<option>패키지</option>
				<option>룸프로모션</option>
			</select>
		</div>

		<div class="rsv_room_list">

			<ul class="rsv_room_choice">
				<c:forEach var="vo" items='${lst }'>
					<li>

						<div class="rsv_room_img">
							<img src="upload/${vo.roomImgList[0]}"onError="this.src='<%=ctx%>/img/no-img.jpg'"> <input
								type="hidden" name="room_type_code"
								value="${vo.room_type_code }" />
						</div>

						<div class="rsv_room_dspwrap">
							<div class="rsv_room_type">${vo.room_type }</div>
							<div class="rsv_room_bedtype">${vo.room_name }<img
									src="/crown/img/link_icon.png" class="modalLink">
							</div>
							<div class="rsv_room_context">${vo.room_area }m²~
								${vo.room_area }m²</div>
						</div>


						<div class="rsv_room_dspwrap1">
							<div class="rsv_room_price">
								<span>KRW</span><span>${vo.room_price }~</span>
							</div>
							<div class="rsv_room_dsp">
								평균가/1박<br />(세금, 봉사료 별도)
							</div>
							<div class="rsv_room_different_date">
								<a href="#">다른날짜 요금보기 ></a>
							</div>
						</div>





						<div class="rsv_room_dspwrap2">
							<div class="rsv_rate">
								<button>요금보기</button>
							</div>
						</div>

						<div class="rsv_room_accordion_list">
							<!-- 메인 이미지 슬라이더 -->
							<div class="rsv_room_po">
								<ol>
									<li class="rsv_price_order"><a href="#" onclick="return false">낮은 가격순</a></li>
									<li class="rsv_price_order"><a href="#" onclick="return false">높은 가격순</a></li>
									<li>평균가/1박(세금, 봉사료 별도)</li>
									
								</ol>
							</div>
							<div class="rsv_prev">
								<img src="<%=ctx%>/img/l1.png" />
								
							</div>
							<input type="hidden" id="room1" name="room1" value="" /> <input
								type="hidden" id="room2" name="room2" value="" /> <input
								type="hidden" id="room3" name="room3" value="" />
							<div class="slider">
								<div class="owl-carousel">

									<div class="item">
										<div class="item_name">${vo.room_name}</div>
										<div class="item_subdsp">${vo.room_sdsp }</div>
										<div class="item_price">${vo.room_price }</div>
									</div>





								</div>
							</div>
							<div class="rsv_next">
								<img src="<%=ctx%>/img/r1.png" />
							</div>


						</div>


						<div class="rsv_room_deatil">
							<div class="rsv_dsp">
								<div>
									<span>패키지 구성<br /> + 클럽라운지 조식 2인<br /> *조식장소는 상황에 따라
										변경될수 있습니다<br /> + [일-목 한정] LATE 체크아웃 15시 (가능시)
									</span>
								</div>
								<div>
									<span> 기타 세부사항<br /> • 패키지 이용 금액은 투숙일자 및 객실타입에 따라 달라질 수
										있습니다.<br /> • 이용하지 않은 패키지의 포함 내역에 대해서는 환불해 드리지 않습니다.<br /> •
										클럽라운지 조식만 제공되는 상품으로 라운지 혜택 (라이트스낵/애프터눈티/해피아워)은 제공되지 않습니다.<br />
										• 성인기준은 14세 이상 (중학생)이며, 어린이 기준은 만4세(49개월)부터 13세(초등학교6학년)까지입니다.<br />


										<span> - 추가요금 조식 1인 ￦30,000 (성인), ￦20,000 (어린이) 보조침대
											￦50,000 </span>
									</span>
								</div>


							</div>
							<div class="rsv_room_detail_dspbox">




								<div class="rsv_additional_request">


									<div class="rsv_room_Breakfast" style="background-color: none;">
										<h2>La Seine</h2>
										<div>

											<span>성인 </span><span>KRW</span><span>30,000</span><span>원</span><br />
											
											<div>
												<button class="bk_minus">-</button>
												<input type="number" name="breakfast1" min="0"
													max="${adult }" value="0" class="bk" readonly />
												<button class="bk_plus">+</button>
											</div>
											
											<br />
											<c:if test="${room_count >=2}">
												<div>
													<button class="bk_minus">-</button>
													<input type="number" name="breakfast2" min="0"
														max="${adult1 }" value="0" class="bk" readonly />
													<button class="bk_plus">+</button>
												</div>
											</c:if>
											<br />
													<c:if test="${room_count ==3 }">
												<div style="display:block">
													<button class="bk_minus">-</button>
													<input type="number" name="breakfast3" min="0"
														max="${adult2 }" value="0" class="bk" readonly />
													<button class="bk_plus">+</button>
												</div>
											</c:if>
											<br /> <span>조식 선택 시, 투숙 일수와 동일한 횟수의 조식이 제공됩니다.<br />
												어린이 조식은 별도 문의 바랍니다.
											</span>

										</div>




									</div>

									<div>

										<h2>추가요청</h2>
										<br /> <label><h3>객실1</h3></label><br /> <input type="text"
											class="additional_request1" name="additional_request1"
											placeholder="예시)추가배드 요청합니다" />
										<c:if test="${room_count>=2 }">
											<label><h3>객실2</h3></label>
											<br />
											<input type="text" class="additional_request2"
												name="additional_request2" placeholder="예시)추가배드 요청합니다" />
										</c:if>
										<c:if test="${room_count ==3 }">
											<label><h3>객실3</h3></label>
											<br />
											<input type="text" class="additional_request3"
												name="additional_request3" placeholder="예시)추가배드 요청합니다" />
										</c:if>
									</div>

								</div>
								<div class="rsv_room_detail_choice">
									<div class="rsv_room_detail_title">
										<h2>객실요금</h2>
									</div>
									<br />
									<div class="rsv_room_detail_info">
										<div>
											<span>객실1</span><span></span><br />
											<span></span>
										</div>
										<br />
										<c:if test="${room_count>=2 }">
											<div>
												<span>객실2</span><span></span><br />
												<span></span>
											</div>
											<br />
										</c:if>
										<c:if test="${room_count ==3 }">
											<div>
												<span>객실3</span><span></span><br />
												<span></span>
											</div>
											<br />
										</c:if>
										<div style="width: 370px; height: 100px">

											<h3>La Seine</h3>
											<span>성인</span><span></span><span
												style="display: inline-block; width: 70px; height: 50px; margin-left: 30px;">0</span>
										</div>
									</div>
									<div class="rsv_room_detail_info2">
										<h3>세금 및 봉사료</h3>
										<br /> <span>세금 및 봉사료</span><span class="result_price"></span><br />
									</div>
									<div class="rsv_room_detail_amount">
										<h2>총예약금액</h2>
										<br /> <br> <span class="ex_price"></span><br> <span>멤버쉽
											가입시 최소3%적립</span>

									</div>
									<div class="rsv_room_detail_policy_item">
										<h3>요금정책</h3>
										<br> <span>해당 요금에 부가세 10%와 봉사료 10% (총 21%)가 부가됩니다</span>

									</div>
									<div class="rsv_room_detail_policy_item2">
										<h3>취소 규정</h3>
										<br /> <span
											style="overflow: scroll; width: 300px; height: 150px;">
											예약 취소 및 변경은 체크인 하루 전 18:00(한국시간)까지 가능합니다.<br /> 예약하신 일자에 체크인
											되지 않거나 또는 위의 지정 시간 이후에 예약을 취소했을<br /> 경우에는 예약 사항에 대해 노-쇼 (No
											Show) 처리 되며, 이에 따른 위약금으로<br /> 예약 첫날에 해당하는 1박 객실요금이 청구되오니
											유의하시기 바랍니다.<br />
										</span>
									</div>
									<div class="rsv_room_detail_policy_item3">
										<h3>예약 문의</h3>
										<br /> <span>TEL +82-2-759-7311~5</span>
									</div>
									<form method="get" action="/crown/init">
										<input type="hidden" value="${check_in }"
											name="Total_check_in" />
										<!-- 체크인 -->
										<input type="hidden" value="${check_out }"
											name="Total_check_out" />
										<!-- 체크아웃-->
										<input type="hidden" value="${room_count }" name="Total_count" />
										<!-- 방수 -->
										<input type="hidden" value="" name="Total_room1" />
										<!--방번호1-->
										<input type="hidden" value="" name="Total_room2" />
										<!--방번호2-->
										<input type="hidden" value="" name="Total_room3" />
										<!--방번호3-->
										<input type="hidden" value="${adult}" name="Total_room1_adult" />
										<!--방인원1-->
										<input type="hidden" value="${adult1}"
											name="Total_room2_adult" />
										<!--방인원2-->
										<input type="hidden" value="${adult2}"
											name="Total_room3_adult" /> <input type="hidden"
											value="${child}" name="Total_room1_child" />
										<!--방인원1-->
										<input type="hidden" value="${child1}"
											name="Total_room2_child" />
										<!--방인원2-->
										<input type="hidden" value="${child2}"
											name="Total_room3_child" />
										<!--방인원3-->
										<input type="hidden" value="" name="Total_pack_code" />
										<!--패키지 번호-->
										<input type="hidden" value="" name="Total_requests1" /> <input
											type="hidden" value="" name="Total_requests2" /> <input
											type="hidden" value="" name="Total_requests3" /> <input
											type="hidden" value="" name="Total_bk_price" />
										<!--주문요청사항-->
										<input type="hidden" value="" name="Total_bk1" /> <input
											type="hidden" value="" name="Total_bk2" /> <input
											type="hidden" value="" name="Total_bk3" />
										<!--조식 요청사항1,2,3-->
										<input type="hidden" value="" name="Total_room_price" /> <input
											type="hidden" value="" name="Total_price" />
										<!--총 가격-->
										<input type="hidden" value="" name="Total_point" />
										<div class="rsv_room_detail_nextbtn">
										<c:if test="${logStatus != null }">
										
										
										
											<input type="submit" class="mem_Rsv"
												style="width: 362px; height: 52px; margin-bottom: 20px; background-color: #385887"
												value="회원 예약">
										</c:if>
												
											<c:if test="${logStatus == null}">
												<input type="button" class="mem_Rsv2"
													style="width: 362px; height: 52px; margin-bottom: 20px; background-color: #385887"
													value="회원 예약">	
												<input type="submit" class="guest_Rsv"
													style="width: 362px; height: 52px; background-color: #555;"
													value="비회원 예약">
											</c:if>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="modal"></div>
						<div class="modal-con">
							<a href="#" class="close" onclick="return false;">X</a>
							<p class="title">객실 정보</p>

							<div class="modal_top">
								<div>
									<img src="/crown/img/room_img.jpg">
								</div>
								<div class="modal_room_type" style="width:200px">${vo.room_name }</div>
								<div class="modal_room_bedtype"><span style="margin-left:-100px;font-size: 35px">${vo.room_type }</span></div>
								<div class="modal_room_content">
									${vo.room_mdsp }
								</div>
							</div>
							<div class="modal_content">
								<span>객실정보</span><br/>
								<span>침대타입 : 싱글</span><span>투숙인원 : 최대3명</span>
								<span>전망 : 비트타워</span><span>객실면적 : ${ vo.room_area}~${vo.room_area }</span><span>체크인/체크아웃 : 15:00 /13:00 </span>
							</div>
							<div class="modal_amenities">
								<span>어메니티</span>
								<br/>

								<div>
								<span>일반</span><br/>
								<span class="general">${vo.room_general }</span>
								</div>
								<div>
								<span>욕실</span><br/>
								<span class="bath">${vo.room_bath }</span>
								</div>
								<div>
								<span >기타</span><br/>
								<span class="etc">${vo.room_etc }</span>
								</div>								
								
							</div>
						</div>
					
					</li>
				</c:forEach>
			</ul>
<!-- //////////////////////////////////////////////////////////////////////////////////////////// -->			
			<ul class="rsv_room_choice">
				<c:forEach var="packvo" items='${packlst }'>
					<li>
						<input type="hidden" name ="packCodeHidden"value="${packvo.pack_code }"/>
						
						<div class="rsv_pack_name" style="width:832px;height:250px">
										<div style="width:700px;height:25px;margin-left:30px;margin-top:30px"><span style="display: inline-block;width:50px;height:20px;background:#ce8f5e;color:#fff;font-size: 12px;text-align: center">패키지 </span></div>
										<div style="width:700px;height:100px;margin-left:30px;margin-top:10px"><span style="display: inline-block; font:bold; width:600px;height:50px;font-size: 40px">${packvo.pack_name }<img src="/crown/img/link_icon.png" style="width:15px;height:15px" class="modalLink"></span></div>
										<div style="width:700px;height:125px;"><span style="display:inline-block;width:400px;height:25px;margin-left:30px;overflow: hidden;">${packvo.pack_sdspsub }</span></div>
						</div>

						<div class="rsv_room_dspwrap1">
							<div class="rsv_room_price">
								<span>KRW</span><span>${packvo.pack_price }</span>
							</div>
							<div></div>
							<div class="rsv_room_dsp">
								평균가/1박<br />(세금, 봉사료 별도)
							</div>
							<div class="rsv_room_different_date">
								<a href="#">다른날짜 요금보기 ></a>
							</div>
						</div>
						<!-- 급하게 수정하느라 css 위치잡느라 추가 -->
						




						<div class="rsv_room_dspwrap2">
							<div class="rsv_rate">
								<button>요금보기</button>
							</div>
						</div>

						<div class="rsv_room_accordion_list">
							<!-- 메인 이미지 슬라이더 -->
							<div class="rsv_room_po">
								<ol>
									<li class="rsv_price_order"><a href="#" onclick="return false">낮은 가격순</a></li>
									<li class="rsv_price_order"><a href="#" onclick="return false">높은 가격순</a></li>
									<li>평균가/1박(세금, 봉사료 별도)</li>
									
								</ol>
							</div>
							<div class="rsv_prev">
								<img src="<%=ctx%>/img/l1.png" />
								
							</div>
							<input type="hidden" id="room1" name="room1" value="" /> <input
								type="hidden" id="room2" name="room2" value="" /> <input
								type="hidden" id="room3" name="room3" value="" />
							<div class="sliderpack">
								<div class="owl-carouselpack">

									<div class="item">
										<div class="item_name"></div>
										<div class="item_subdsp"></div>
										<div class="item_price"></div>
									</div>





								</div>
							</div>
							<div class="rsv_next">
								<img src="<%=ctx%>/img/r1.png" />
							</div>


						</div>


						<div class="rsv_room_deatil">
							<div class="rsv_dsppack">
								<div>
									<span>
									${packvo.sdsp }
									</span>
								</div>
								<div>
									<span>${packvo.dsp }<br/>
									<br/>
									<br/>

										<span> - 추가요금 조식 1인 ￦30,000 (성인), ￦20,000 (어린이) 보조침대
											￦50,000 </span>
									</span>
								</div>


							</div>
							<div class="rsv_room_detail_dspbox">




								<div class="rsv_additional_request">


									

									<div>

										<h2>추가요청</h2>
										<br /> <label><h3>객실1</h3></label><br /> <input type="text"
											class="additional_request1" name="additional_request1"
											placeholder="예시)추가배드 요청합니다" />
										<c:if test="${room_count>=2 }">
											<label><h3>객실2</h3></label>
											<br />
											<input type="text" class="additional_request2"
												name="additional_request2" placeholder="예시)추가배드 요청합니다" />
										</c:if>
										<c:if test="${room_count ==3 }">
											<label><h3>객실3</h3></label>
											<br />
											<input type="text" class="additional_request3"
												name="additional_request3" placeholder="예시)추가배드 요청합니다" />
										</c:if>
									</div>

								</div>
								<div class="rsv_room_detail_choice">
									<div class="rsv_room_detail_title">
										<h2>객실요금</h2>
									</div>
									<br />
									<div class="rsv_room_detail_info_pack">
										<div>
											<span>객실1</span><span></span><br />
											<span></span>
										</div>
										<br />
										<c:if test="${room_count>=2 }">
											<div>
												<span>객실2</span><span></span><br />
												<span></span>
											</div>
											<br />
										</c:if>
										<c:if test="${room_count ==3 }">
											<div>
												<span>객실3</span><span></span><br />
												<span></span>
											</div>
											<br />
										</c:if>
										<div style="width: 370px; height: 100px">

											
										</div>
									</div>
									<div class="rsv_room_detail_info2">
										<h3>세금 및 봉사료</h3>
										<br /> <span>세금 및 봉사료</span><span class="result_price"></span><br />
									</div>
									<div class="rsv_room_detail_amount">
										<h2>총예약금액</h2>
										<br /> <br> <span class="ex_price"></span><br> <span>멤버쉽
											가입시 최소3%적립</span>

									</div>
									<div class="rsv_room_detail_policy_item">
										<h3>요금정책</h3>
										<br> <span>해당 요금에 부가세 10%와 봉사료 10% (총 21%)가 부가됩니다</span>

									</div>
									<div class="rsv_room_detail_policy_item2">
										<h3>취소 규정</h3>
										<br /> <span
											style="overflow: scroll; width: 300px; height: 150px;">
											예약 취소 및 변경은 체크인 하루 전 18:00(한국시간)까지 가능합니다.<br /> 예약하신 일자에 체크인
											되지 않거나 또는 위의 지정 시간 이후에 예약을 취소했을<br /> 경우에는 예약 사항에 대해 노-쇼 (No
											Show) 처리 되며, 이에 따른 위약금으로<br /> 예약 첫날에 해당하는 1박 객실요금이 청구되오니
											유의하시기 바랍니다.<br />
										</span>
									</div>
									<div class="rsv_room_detail_policy_item3">
										<h3>예약 문의</h3>
										<br /> <span>TEL +82-2-759-7311~5</span>
									</div>
									<form method="get" action="/crown/init">
										<input type="hidden" value="${check_in }"
											name="Total_check_in" />
										<!-- 체크인 -->
										<input type="hidden" value="${check_out }"
											name="Total_check_out" />
										<!-- 체크아웃-->
										<input type="hidden" value="${room_count }" name="Total_count" />
										<!-- 방수 -->
										<input type="hidden" value="" name="Total_room1" />
										<!--방번호1-->
										<input type="hidden" value="" name="Total_room2" />
										<!--방번호2-->
										<input type="hidden" value="" name="Total_room3" />
										<!--방번호3-->
										<input type="hidden" value="${adult}" name="Total_room1_adult" />
										<!--방인원1-->
										<input type="hidden" value="${adult1}"
											name="Total_room2_adult" />
										<!--방인원2-->
										<input type="hidden" value="${adult2}"
											name="Total_room3_adult" /> <input type="hidden"
											value="${child}" name="Total_room1_child" />
										<!--방인원1-->
										<input type="hidden" value="${child1}"
											name="Total_room2_child" />
										<!--방인원2-->
										<input type="hidden" value="${child2}"
											name="Total_room3_child" />
										<!--방인원3-->
										<input type="hidden" value="" name="Total_pack_code" />
										<!--패키지 번호-->
										<input type="hidden" value="" name="Total_requests1" /> <input
											type="hidden" value="" name="Total_requests2" /> <input
											type="hidden" value="" name="Total_requests3" /> <input
											type="hidden" value="" name="Total_bk_price" />
										<!--주문요청사항-->
										<input type="hidden" value="" name="Total_bk1" /> <input
											type="hidden" value="" name="Total_bk2" /> <input
											type="hidden" value="" name="Total_bk3" />
										<!--조식 요청사항1,2,3-->
										<input type="hidden" value="" name="Total_room_price" /> <input
											type="hidden" value="" name="Total_price" />
										<!--총 가격-->
										<input type="hidden" value="" name="Total_point" />
										<div class="rsv_room_detail_nextbtn">
										<c:if test="${logStatus != null }">
										
										
										
											<input type="submit" class="mem_Rsv"
												style="width: 362px; height: 52px; margin-bottom: 20px; background-color: #385887"
												value="회원 예약">
										</c:if>
												
											<c:if test="${logStatus == null}">
												<input type="button" class="mem_Rsv2"
													style="width: 362px; height: 52px; margin-bottom: 20px; background-color: #385887"
													value="회원 예약">	
												<input type="submit" class="guest_Rsv"
													style="width: 362px; height: 52px; background-color: #555;"
													value="비회원 예약">
											</c:if>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="modal"></div>
						<div class="modal-con">
							<a href="#" class="close" onclick="return false;">X</a>
							<p class="title">패키지 정보</p>

							<div class="modal_top">
								<div>
									<img src="/crown/img/room_img.jpg">
								</div>
								<div class="modal_room_type" style="width:400px;font-size: 30px">${packvo.pack_name }</div>
								
								<div class="modal_room_content" style="width:600px;height:200px">
									${packvo.dsp }<br/>
									<br/>
									<br/>
									패키지 기간 : ${packvo.pack_start } ~ ${packvo.pack_end }
								</div>
								
							</div>
								<div>
						
								<div style="width:1000px;margin-left:60px;height:400px; background: #f5f5f5">
								<div style="font-size:16px;width:1000px;height:100px;margin-left:70px">패키지 구성 <br/>${packvo.pack_sdspsub }<br/>패키지 구성은 상황에따라 변경될수있습니다.</div><br/>
								<div style="font-size: 14px;width:1000px;height:120px;margin-left:70px">기타 세부사항<br/>
		• 패키지 이용 금액은 투숙일자 및 객실타입에 따라 달라질 수 있습니다.<br/>
		• 이용하지 않은 패키지의 포함 내역에 대해서는 환불해 드리지 않습니다.<br/>
		• 클럽라운지 조식만 제공되는 상품으로 라운지 혜택 (라이트스낵/애프터눈티/해피아워)은 제공되지 않습니다.<br/>
		• 성인기준은 14세 이상 (중학생)이며, 어린이 기준은 만4세(49개월)부터 13세(초등학교6학년)까지입니다.<br/>
							</div>
							<div style="width:1000px;height:100px;margin-top:40px;margin-left:70px">
								- 추가요금<br/>
								조식 1인 ￦30,000 (성인), ￦20,000 (어린이)<br/>
								보조침대 ￦50,000<br/>
								</div>	
								
								</div>
							</div>
					</div>
					</li>
				</c:forEach>
			</ul>
			
			
			
			
			</div>
			<!-- //////////////////////////////////////////////////////////////////////////////////// -->
</div>
	<div class="wrap-loading display-none">

		<div>
			<img src="<%=ctx%>/img/giphy.gif" />
		</div>

	</div>

</section>
