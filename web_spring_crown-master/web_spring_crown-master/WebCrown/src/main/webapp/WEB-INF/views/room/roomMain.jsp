<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script>
$(function(){
	
/*==== 체크버튼 전체 선택 / 해제 =====*/
	$(document).on('change','#rOptionAll',function(){
		var $this = $(this);
		var checked = $this.prop('checked'); // checked 문자열 참조(true, false)
	    console.log("라디오 버튼 checked ="+ checked);
	
	    $('input[name="rOption1"]').prop('checked', checked);
	    $('input[name="rOption2"]').prop('checked', checked);
	    $('input[name="rOption3"]').prop('checked', checked);
		
	});
	
	$(document).on('change','.rOption',function(){
		var $this = $(this);
		var isChecked1 = $("input:checkbox[name='rOption1']:checked").length;
		var isChecked2 = $("input:checkbox[name='rOption2']:checked").length;
		var isChecked3 = $("input:checkbox[name='rOption3']:checked").length;
		var checkedLength=isChecked1+isChecked2+isChecked3;
		
		console.log("체크박스 체크 된 갯수 : "+checkedLength);
		var selectAll = (checkedLength == 3);
		console.log("체크박스 체크 selectAll : "+selectAll);
		$("#rOptionAll").prop('checked', selectAll);
	});
	

});
</script>
</head>
<section>
	<div id="roomContainer">
		<!-- 홈 바로가기 -->
		<div class="r_sub_container" >
			<div class="r_inner">
				<div id="rLoc">
            		<span><a href="<%=ctx%>/">홈</a></span>
		            <span>객실</span>
		        </div>
			</div>
		</div>
		<!-- 객실 설명  -->
		<div class="r_sub_container" >
			<div class="r_inner r_space_bottom">
				<div class="r_inner_box">
					<h1 id="rHeadLine">객실</h1>
					<p id="rSubcopy">서울의 역사와 비즈니스의 중심 신촌역에 위치한 크라운호텔 서울은 1,015실 규모를 갖춘 한국 최고의 럭셔리 호텔입니다. 서울 다운타운의 중심에서 남산과 명동, 스카이라인을 감상할 수 있는 크라운호텔 서울은 세계적인 인테리어 회사들이 참가하여 설계한 독창적인 객실을 갖추고 있으며 성공적인 비즈니스를 위한 최적의 공간입니다.</p>
				</div>
			</div>
		</div>
		
		<!-- 객실 리스트 -->
		<div class="r_sub_container" >
			<div class="r_inner">
				<form method="get" action="<%=ctx%>/roomMain">
				<!-- 검색옵션 -->
				<div id="rOptionBox">
					<strong id="rOptionTitle">객실타입</strong>
					<div id="rOptionContent">
						<div>
							<span class="r_input_item"><input type="checkbox" id="rOptionAll" name="rOptions" <c:if test="${pvo.rOptionsList==null}">checked</c:if> <c:if test="${pvo.rOption1!='' && pvo.rOption2!='' && pvo.rOption3!=''}">checked</c:if>><label for="rOptionAll">전체</label></span>
							<span class="r_input_item rOption"><input type="checkbox" id="rOptionStandard" name="rOption1" value="스탠다드" <c:if test="${pvo.rOptionsList==null || pvo.rOption1=='스탠다드'}"> checked</c:if>/><label for="rOptionStandard">스탠다드</label></span>
							<span class="r_input_item rOption"><input type="checkbox" id="rOptionDelux" name="rOption2" value="클럽 플로어" <c:if test="${pvo.rOptionsList==null || pvo.rOption2=='클럽 플로어'}"> checked</c:if>/><label for="rOptionDelux">클럽 플로어</label></span>
							<span class="r_input_item rOption"><input type="checkbox" id="rOptionSuite" name="rOption3" value="스위트" <c:if test="${pvo.rOptionsList==null || pvo.rOption3=='스위트'}"> checked</c:if>/><label for="rOptionSuite">스위트</label></span>
						</div>
						<input type="submit" id="rOptionSearch" value="검색"/>
					</div>
				</div><!-- 검색옵션 end-->
				<!-- 정렬 -->
				<div id="rSort">
					<select id="rSelect" name="rOrder" onchange="this.form.submit()">
					    <option value="">검색</option>
					    <option value="room_low_price" <c:if test="${pvo.rOrder=='room_low_price'}">selected</c:if>>낮은가격순</option>
					    <option value="room_high_price" <c:if test="${pvo.rOrder=='room_high_price'}"> selected</c:if>>높은가격순</option>
					</select>
				</div>
				</form>
				<!-- 객실 정보 리스트 -->
				<ul id="rList">
				<c:forEach var="vo" items="${list}">
					<!-- 객실 아이템 -->
					<li class="r_room">
						<!-- 객실 이미지  슬라이드-->
						<div class="r_slider_wrap">
							<div class="r_slider_box" >
								<c:forEach var="img" items="${vo.roomImgList}">
									<div class="r_slick-slider">
										<a href="<%=ctx%>/room?room_type_code=${vo.room_type_code}"><img  src="upload/${img}" class="scale" onError="this.src='img/no-img.jpg'"/></a>
									</div>
								</c:forEach>
							</div>
							<!-- 슬라이드 버튼 -->
							<div class="r_slider_left"><i class="xi-angle-left"></i></div>
							<div class="r_slider_right"><i class="xi-angle-right"></i></div>	
						</div>
						<!-- 객실 정보 -->
						<div class="r_content">
							<div class="r_inside">
								<h2>
									<span>
										<span class="r_type">GRAND CROWN HOTEL</span>
										<span class="r_type">${vo.room_type }</span>
									</span>
									<a href="<%=ctx%>/room?room_type_code=${vo.room_type_code}" class="r_name">${vo.room_name }</a>
								</h2>
								<div class="r_info">
									<div class="r_info_item">
										<strong class="r_info_title">침대타입</strong>
										<strong class="r_info_text">더블/트윈</strong>
									</div>
									<div class="r_info_item">
										<strong class="r_info_title">전망</strong>
										<strong class="r_info_text">시티뷰</strong>
									</div>
									<div class="r_info_item">
										<strong class="r_info_title">투숙인원</strong>
										<strong class="r_info_text">2~3명</strong>
									</div>
									<div class="r_info_item">
										<strong class="r_info_title">객실면적</strong>
										<strong class="r_info_text">${vo.room_area}㎡</strong>
									</div>
									<div class="r_info_item">
										<strong class="r_info_title">객실금액</strong>
										<strong class="r_info_text"><fmt:formatNumber value="${vo.room_price}" pattern="#,###"/> 원</strong>
									</div>
								</div>
								<a href="<%=ctx%>/room?room_type_code=${vo.room_type_code}" class="r_link"><span>자세히보기</span></a>
							</div><!-- r_inside -->
							<a href="#" class="r_btn">요금조회</a>
						</div><!-- 객실 정보 end  -->
					</li><!-- 객실 아이템 end-->
				</c:forEach>
					
				</ul><!-- 객실 정보 리스트 end -->
				<p class="r_msg">객실요금은 오늘 기준의 1박 최저가 금액이며 예약하시는 날짜에 따라 다를 수 있습니다.</p>
			</div>
		</div><!-- 객실 리스트 end-->
	</div>
</section>