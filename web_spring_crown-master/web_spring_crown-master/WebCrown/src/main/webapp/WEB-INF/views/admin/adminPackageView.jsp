<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="admin_content_wrap">
		<div class="admin_content_top">
			<div class="admin_content_title">
				<h2>패키지 상세 페이지</h2>
				<div class="admin_btn_box">
					<a href="<%=ctx%>/adminPackEdit?pack_code=${apvo.pack_code}"><div class="admin_btn" id="update">수정</div></a>
	   			</div>
			</div>
		</div>
		<div class="admin_content_box admin_half_w ">
			<div class="admin_content_form">
				<div class="admin_pack_view">
					<div>적용 객실 타입 : ${pack_roomType}</div><br/>
					<div>패키지 이름 : ${apvo.pack_name}</div><br/>
					<div>패키지 설명</div>
					<div>${apvo.dsp}</div><br/>
					<div>패키지 옵션</div>
					<c:if test="${apvo.chkBoxOp1 != null && apvo.chkBoxOp1=='SUN-FRI ONLY'}">
						SUN-FRI ONLY 
					</c:if>
					<c:if test="${apvo.chkBoxOp2 != null && apvo.chkBoxOp2=='SAT ONLY'}">
						SAT ONLY 
					</c:if>
					<c:if test="${apvo.chkBoxOp3 != null && apvo.chkBoxOp3=='조식'}">
						조식 
					</c:if>
					<c:if test="${apvo.chkBoxOp4 != null && apvo.chkBoxOp4=='석식'}">
						석식 
					</c:if>
					<c:if test="${apvo.chkBoxOp5 != null && apvo.chkBoxOp5=='키즈'}">
						키즈 
					</c:if>
					<c:if test="${apvo.chkBoxOp6 != null && apvo.chkBoxOp6=='성인'}">
						성인 
					</c:if>
					<c:if test="${apvo.chkBoxOp7 != null && apvo.chkBoxOp7=='시즌'}">
						시즌
					</c:if>
					<hr/>
					<div>패키지 아이템</div>
					<div>${apvo.sdsp}</div><br/>
					<div>가격 : <fmt:formatNumber pattern="###,###,###" value="${apvo.pack_price}"></fmt:formatNumber>원</div><hr/>
					<div>패키지 기간</div>
					<div>${apvo.pack_start} ~ ${apvo.pack_end}</div><br/>
					<div>패키지 갯수 : ${apvo.pack_num}개</div>					
				</div>
			</div>
		</div>
		<div class="admin_content_box admin_half_w ">
			<div class="admin_content_form">
				<div>대표 이미지</div>
				<div><img src="upload/${apvo.img}" onError="this.src='<%=ctx%>/img/no-img.jpg'" style="width:300px;"/></div>
			</div>
		</div>
	</div>
</div>
</section>