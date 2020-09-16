<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section>
<div class="rsvChk">
<div class="rsvChkTitle">
<h1>예약조회/예약취소</h1>
<span>아래 정보를 기입하신 후, 확인 버튼을 눌러주십시오.<br/>
예약번호를 분실하신 고객님께서는 롯데호텔 객실예약과로 직접 문의하여 주십시오.</span>
</div>
<div style="width:1280px; margin-bottom: 100px;">
<h5 style="text-align:center">롯데호텔 리워즈 회원으로 객실, 패키지 또는 레스토랑을 예약하신 경우 마이페이지 > 예약내역 페이지에서 조회하실 수 있습니다.</h5>
		<a href="<%=ctx %>/loginForm" style="margin-left:600px;">로그인</a>
</div>
<div style="width:1280px;">
<h2 style="text-align: center;">객실/패키지 예약조회</h2>
<h3 style="text-align: center">온라인 예약 번호 입력 </h3>
<form method="POST" action="/crown/rsvChk" class="chkForm">
<input type="text" name="payment_code" style="width:600px;height:50px;text-align:center;margin-left:300px;background-color: #f5f5f5" value="" placeholder="예약번호를 입력해주세요"/><br/>
<input type="text" style="width:300px;height:50px;margin-left:300px;margin-top:30px;text-align: center;background-color:#f5f5f5"  placeholder="성" name ="guestFirstName" value = ""/>
<input type="text" style="width:300px;height:50px;text-align: center;background-color:#f5f5f5" placeholder="이름" name ="guestLastName" value=""/><br/>

<input type="submit" value="확인" style="width:200px;height:70px;background-color:#ad9e87;margin-left:520px;margin-top:50px;color:white"/>


</form>
</div>


</div>

</section>