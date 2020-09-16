<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
var room_code = ${vo.room_code};

$(function(){
	var separator ="";
	$(document).on('click','#update',function(){
		
		separator = "E";
		adminPasswordChk(separator);
	});
	
	$(document).on('click','#delete',function(){
		separator = "D";
		adminPasswordChk(separator);
	});
});

function adminPasswordChk(separator){
	var room_separator = "R"; 
	window.open("adminPasswordChk?room_code="+room_code+"&separator="+separator+"&room_separator="+room_separator,
				"adminPasswordChk",
				"width=570, height=350, top=200, left=700, scrollbars=no, resizable=no, toolbars=no, menubar=no");
}

</script>

		<div class="admin_content_wrap">
		
			<div class="admin_content_top">
				<div class="admin_content_title">
					<h2>객실 상세 페이지</h2>
					<div class="admin_btn_box">
						<div class="admin_btn" id="update">수정</div>
						<div class="admin_btn" id="delete">삭제</div>
	   				</div>
				</div>
			</div>
	
			<div class="admin_content_box">
				<div class="admin_content_form">
					<div>
						<div>객실 코드 : ${vo.room_code }</div>
					</div>
				</div>
				<div class="admin_content_form">
					<div>
						<div>객실 호수 : ${vo.room_num }</div>
					</div>
				</div>
				<div class="admin_content_form">
					<div>
						<div>객실 타입 : ${vo.room_type }</div>
					</div>
				</div>
				<div class="admin_content_form">
					<div>
						<div>객실 이름 : ${vo.room_name}</div>
					</div>
				</div>
				<div class="admin_content_form">
					<div>
						<div>객실 가격 : ${vo.room_price}</div>
					</div>
				</div>
				<div class="admin_content_form">
					<div>
						<div>객실 최대인원(어른) : ${vo.max_adult }</div>
						<div>객실 최대인원(아이) : ${vo.max_child }</div>
					</div>
				</div>
				<div class="admin_content_form">
					<div>
						<div>객실 침대타입 : ${vo.bed }</div>
					</div>
				</div>
			</div>
		</div><!-- admin_content_wrap -->
	</div>
</section>