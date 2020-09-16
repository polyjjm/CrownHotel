<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
			$(function(){
				function addCommas(x) {
				    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}
				function removeCommas(x) {
				    if(!x || x.length == 0) return "";
				    else return x.split(",").join("");
				}




				$("input[name = usePointInput]").on("keyup", function() {
				    var point = ${memvo.point}
					$(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
				    if(point*1 <$("input[name = usePointInput]").val().replace(",","")*1){
				    	alert("보유포인트가 부족합니다");
				    	$("input[name = usePointInput]").val("0");
				    }
				});

			});
			
			</script>
<section>

<div id="rsv_info_main">
<div class="rsv_guest_info">

		<div id="rsv_room_selection_title">
			<ol>
				<li>
					<a href="/crown/rsv">01 날짜,인원선택</a>
				</li>
				<li > > <a href="#"  onclick="history.back();">02 객실,요금,옵션선택</a></li>
				<li > > 03 고객정보입력</li>

			</ol>
		</div>
		<div id="rsv_guest_field">
		<h2>예약자정보</h2> <br/>
			<div class="rsv_guest_name">
			<label>성명</label><br/>
			<input type="text" id="guest_first_name" name="guest_first_name" value="${memvo.user_first_name }"  placeholder="성"/><input type="text" id="guest_last_name" name="guest_last_name" value="${memvo.user_last_name }"  placeholder="이름"/>
			</div>
			<div class="rsv_guest_email">
			<label>이메일</label><br/> 
			<input type="text" id="guest_email" name="guest_email" placeholder="example@crown.com" value="${memvo.user_email }"/>
			</div>
			<div class="rsv_guest_tel">
			<label>연락처</label><br/>
			<select id="tel1" name="tel1"  >
			<c:if test="${memvo.user_tel1 !=null}">
			<option selected="selected">${memvo.user_tel1 }</option>
			</c:if>
			<option>010</option>
			<option>011</option>
			</select>
			
			
			<input type="text" id="tel2"name="tel2" value="${memvo.user_tel2 }"/><input type="text" name="tel3" id="tel3" value="${memvo.user_tel3 }"/><br/>
			<span>띄어쓰기 없이 ‘-’를 생략한 형식으로 입력하세요.</span><br/>
			<span>연락처 항목 동의는 필수입니다.</span>
			</div>
			<c:if test="${logStatus != null}">
			<div class="point">
			<label class="userPoint">보유 포인트 : ${memvo.point }</label><label>원</label><br/>
			<label>사용할 포인트 : </label><input type="text" name="usePointInput" value="0" /><span>원</span>
			
			
			</div>
			</c:if>
			<div class="rsv_guest_card">
			


			<span>예약 접수 확인 용도이며, 온라인 예약시 직접 결제가 이루어지지 않습니다.</span><br/>
			<span>유효기간 월 항목 동의는 필수입니다.</span><br/>
			
			<label style="margin-top:30px">필수적 개인정보수집이용에 대한 동의(객실예약)</label><br/>
			
			<div style=" overflow:auto;width:740px;height:180px;margin-top:30px;background-color:#f5f5f5;">
			
			롯데호텔의 국내 및 해외 체인호텔 (http://www.lottehotel.com/global/ko/hotel-finder.html)은 롯데호텔 객실예약과 관련하여 아래와 같이 귀하의 개인정보를 수집 및 이용합니다.

			1. 개인정보 수집항목
			- 성명(영문), 생년월일, 연락처(모바일, 자택 또는 회사), 이메일, 신용카드 정보(신용카드 종류, 신용카드번호 및 유효기간 포함)

			2. 개인정보 수집 및 이용목적
			- 객실 예약 서비스 제공, 예약 관련 안내 및 고지사항 전달, 고객 불만 등 민원 처리, 부정이용 방지, 법적 분쟁 등의 처리
			* 신용카드 정보 수집은 개런티 목적으로 직접 결제는 이루어지지 않습니다.

			3. 개인 정보 보유 및 이용 기간
			- 수집일로부터 2년. 단, 예약 취소 시 취소일로부터 5일후 파기됩니다.

			4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
			- 귀하는 위와 같은 개인정보의 수집이용에 대한 동의를 거부할 수 있으나, 동의 거부 시, 객실 예약이 불가능합니다.
			4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
			- 귀하는 위와 같은 개인정보의 수집이용에 대한 동의를 거부할 수 있으나, 동의 거부 시, 객실 예약이 불가능합니다.
			4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
			- 귀하는 위와 같은 개인정보의 수집이용에 대한 동의를 거부할 수 있으나, 동의 거부 시, 객실 예약이 불가능합니다.
			4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
			- 귀하는 위와 같은 개인정보의 수집이용에 대한 동의를 거부할 수 있으나, 동의 거부 시, 객실 예약이 불가능합니다.
			</div>
			<div style="width:300px;height:100px;">
			<input type="checkbox" name="chk2" id="chk2" style="height:10px"/>
			<span>개인정보수집을 동의합니다.</span></div>
			</div>
			
		</div>
		<div id="rsv_guest_field_choice">
		<div id='rsv_info_title'>
		<label><h3>선택정보 입력</h3></label>
		<img src="/crown/img/info_image.jpg"/>
		</div>
		
		<div class="rsv_info" style="margin-top:30px;">
		<label>체크인 - 체크아웃</label><br/>
		<span>${vo.check_in } ~ ${vo.check_out }</span>
		</div>
		
		<div class="rsv_info">
		<label>객실 - 투숙인원</label><br/>
		<span>객실 ${vo.room_count }성인${vo.room1_adult+vo.room2_adult+vo.room3_adult}어린이${vo.room1_child+vo.room2_child+vo.room3_child }</span>
		</div>
		<div class="rsv_info">
		<label>요금상세내역</label><br/>
		<label>객실요금</label><span>KRW ${Total_room_price * vo.room_count }</span><span>원</span><br/>
		<c:if test="${Total_bk_price !=0 }">
		<label>조식(성인)</label><span>KRW ${Total_bk_price}</span><span>원</span><br/>
		</c:if>
		<label>세금 및 봉사료</label><span>KRW <fmt:parseNumber var="percent" value="${(Total_room_price * vo.room_count) / 10}" integerOnly="true" />${percent }</span><span>원</span><br/>
		
		</div>
		<div class="rsv_info">
		<label>총 예약금액</label><span>KRW${vo.price }</span><span>원</span>
		</div>
		<div class="rsv_info">
		<label>요금정책</label><br/>
		<span>해당 요금에 부가세 10%와 봉사료 10% (총 21%)가 부가됩니다.</span><br/>
		 <label>취소 규정</label><br/>
		 <span style="overflow: auto;display:inline-block; width:375px;height:100px; background-color:#f5f5f5 ">
		 예약 취소 및 변경은 체크인 하루 전 18:00(한국시간)까지 가능합니다.
		  예약하신 일자에 체크인 되지 않거나 또는 위의 지정 시간 이후에 예약을 
		  취소했을 경우에는 예약 사항에 대해 노-쇼 (No Show) 처리 되며, 
		  이에 따른 위약금으로 예약 첫날에 해당하는 1박 객실요금이 청구되오니 
		  유의하시기 바랍니다.
		 </span><br/>
		 <input type="checkbox" name="chk1" id="chk1"/><span>취소 규정을확인하고동의함</span><br/>
		</div>
		<div class="rsv_info" style="margin-top:150px;">
		<label>예약문의</label><br/>
		<span>TEL : +82-2-759-7311~5</span><br/>
		<input type="button" style="width:362px;height:52px;margin-bottom:20px;background-color: #385887;border:none;color:white;"class="pay" value="결제">
		</div>
</div>
</div>

</div>
<form method="post" id="payForm">



										<input type="hidden" value="${vo.check_in }" name="check_in" />
										<!-- 체크인 -->
										<input type="hidden" value="${vo.check_out }" name="check_out" />
										<!-- 체크아웃-->
										<input type="hidden" value="${vo.room_count }" name="room_count" />
										<!-- 방수 -->
										<input type="hidden" value="${vo.room_num1 }" name="room_num1" />
										<!--방번호1-->
										<input type="hidden" value="${vo.room_num2 }" name="room_num2" />
										<!--방번호2-->
										<input type="hidden" value="${vo.room_num3 }" name="room_num3" />
										<!--방번호3-->
										<input type="hidden" value="${vo.room1_adult}" name="room1_adult" />
										<!--방인원1-->
										<input type="hidden" value="${vo.room2_adult}" name="room2_adult" />
										<!--방인원2-->
										<input type="hidden" value="${vo.room3_adult}" name="room3_adult" />
										<input type="hidden" value="${vo.room1_child}" name="room1_child" />
										<!--방인원1-->
										<input type="hidden" value="${vo.room2_child}" name="room2_child" />
										<!--방인원2-->
										<input type="hidden" value="${vo.room3_child}" name="room3_child" />
										<!--방인원3-->
										<input type="hidden" value="${vo.pack_code }" name="pack_code" />
										<!--패키지 번호-->
										<input type="hidden" value="${vo.require1 }" name="require1" />
										<input type="hidden" value="${vo.require2 }" name="require2" />
										<input type="hidden" value="${vo.require3 }" name="require3" />
										<input type="hidden" value="${Total_bk_price }" name="bk_price"/>
										<!--주문요청사항-->
										<input type="hidden" value="${vo.bk1 }" name="bk1" />
										<input type="hidden" value="${vo.bk2 }" name="bk2" />
										<input type="hidden" value="${vo.bk3 }" name="bk3" />
										<c:if test="${logStatus != null}">
										<input type="hidden" value="${vo.point }" name="point" />
										</c:if>
										<!--조식 요청사항1,2,3-->
										<input type="hidden" value="${Total_room_price }" name="room_price" />
										<input type="hidden" value="" name="guestName"/>
										<input type="hidden" value="" name="guestEmail"/>
										<input type="hidden" value="" name="guestTel"/>
										<input type="hidden"  value="" name="usePoint" />
										<input type="hidden"  value="${vo.savePoint }" name="savePoint" />
										
										
</form>





</section>