<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section>
<div id="rsv_info_main">
<div class="rsv_guest_info">

		<div id="rsv_room_selection_title">
			<ol>
				<li>
					<a href="/crown/rsv">01 날짜,인원선택</a>
				</li>
				<li > > 02 객실,요금,옵션선택</li>
				<li > > 03 고객정보입력</li>

			</ol>
		</div>
		<div id="rsv_guest_field">
		<h2>예약자정보</h2> <br/>
			<div class="rsv_guest_name">
			<label>성명</label><br/>
			<input type="text" id="guest_first_name" name="guest_first_name" value=""  placeholder="성"/><input type="text" id="guest_last_name" name="guest_last_name" value=""  placeholder="이름"/>
			</div>
			<div class="rsv_guest_email">
			<label>이메일</label><br/> 
			<input type="text" id="guest_email" name="guest_email" placeholder="example@crown.com"/>
			</div>
			<div class="rsv_guest_tel">
			<label>연락처</label><br/>
			<select id="tel1" name="tel1">
			<option>010</option>
			<option>011</option>
			</select><input type="text" id="tel2"name="tel2"/><input type="text" name="tel3" id="tel3"/><br/>
			<span>띄어쓰기 없이 ‘-’를 생략한 형식으로 입력하세요.</span><br/>
			<span>연락처 항목 동의는 필수입니다.</span>
			</div>	
			
			
			<div class="rsv_guest_card">
			<h2>신용카드 정보</h2><br/>
			<label>신용카드 정보</label><br/>
			<select id="card">
			<option>신용카드 정보</option>
			</select><br/>
			<label>신용카드번호</label><br/>
			<div id ="card_num"><input type="text"/>-<input type="text"/>-<input type="text"/>-<input type="text"/><br/></div>
			<span>입력 칸에 번호를 4자리씩 나누어 입력해주세요.</span><br/>
			<label>유효기간</label><br/>
			<select class="validity">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
			<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
			</select>
			<select class="validity">
			<option>2022</option>
			<option>2023</option>
			<option>2024</option>
			<option>2025</option>
			<option>2026</option>
			<option>2027</option>
			<option>2028</option>
			<option>2029</option>
			<option>2030</option>
			<option>2031</option>
			<option>2032</option>
			<option>2033</option>
			</select><br/>
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
			<input type="checkbox" style="height:10px"/>
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
		<span>2020-06-18 ~ 2020-06-20(2박)</span>
		</div>
		
		<div class="rsv_info">
		<label>객실 - 투숙인원</label><br/>
		<span>객실1, 성인2, 어린이0</span>
		</div>
		<div class="rsv_info">
		<label>요금상세내역</label>
		<label>객실요금(2박)</label><span>KRW 620,000</span><br/>
		
		<label>조식(성인)</label><span>KRW 120,000</span><br/>
		<label>세금 및 봉사료</label><span>KRW 155,400</span><br/>
		
		</div>
		<div class="rsv_info">
		<label>총 예약금액</label><span>KRW 895,400</span>
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
		 <input type="checkbox"/><span>취소 규정을확인하고동의함</span><br/>
		</div>
		<div class="rsv_info" style="margin-top:150px;">
		<label>예약문의</label><br/>
		<span>TEL : +82-2-759-7311~5</span><br/>
		<button style="width:362px;height:52px;margin-bottom:20px;background-color: #385887;border:none;color:white;" class="pay">결제</button>
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
										<!--조식 요청사항1,2,3-->
										<input type="hidden" value="${Total_room_price }" name="room_price" />
										<input type="hidden" value="" name="guestName"/>
										<input type="hidden" value="" name="guestEmail"/>
										<input type="hidden" value="" name="guestTel"/>

										
										
</form>









</section>