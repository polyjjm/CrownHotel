<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
function delCheck() {
	if(confirm("삭제하시겠습니까?")){
		location.href="<%=ctx%>/adminEventDel?event_code=${aevo.event_code}";
	}
}
</script>
	<div class="admin_content_wrap">
		<div class="admin_content_top">
			<div class="admin_content_title">
				<h2>패키지 상세 페이지</h2>
				<div class="admin_btn_box">
					<a href="<%=ctx%>/adminEventEdit?event_code=${aevo.event_code}"><div class="admin_btn" id="update">수정</div></a>
					<a href="javascript:delCheck();"><div class="admin_btn" id="delete">삭제</div></a>
	   			</div>
			</div>
		</div>
		<div class="admin_content_box admin_half_w ">
			<div class="admin_content_form">
				<div class="admin_pack_view">
					<div>이벤트 제목 : ${aevo.event_name}</div><br/>
					<div>이벤트 내용</div>
					<div>${aevo.event_mdsp}</div><br/>
					<div>상세 내용</div>
					<div>${aevo.event_sdsp}</div><br/>
					<div>이벤트 기간</div>
					<div>${aevo.event_start} ~ ${aevo.event_end}</div><br/>				
				</div>
			</div>
		</div>
		<div class="admin_content_box admin_half_w ">
			<div class="admin_content_form">
				<div>대표 이미지</div>
				<div><img src="upload/${aevo.img}" onError="this.src='<%=ctx%>/img/no-img.jpg'" style="width:300px;"/></div>
			</div>
		</div>
	</div>
</div>
</section>