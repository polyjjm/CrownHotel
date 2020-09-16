<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	var room_type_code = ${vo.room_type_code};
	
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
		var room_separator = "T"; 
		window.open("adminPasswordChk?room_type_code="+room_type_code+"&separator="+separator+"&room_separator="+room_separator,
					"adminPasswordChk",
					"width=570, height=350, top=200, left=700, scrollbars=no, resizable=no, toolbars=no, menubar=no");
	}
	
</script>

		<div class="admin_content_wrap">
			<div class="admin_content_top">
				<div class="admin_content_title">
					<h2>객실 타입 상세 페이지</h2>
					<div class="admin_btn_box">
						<div class="admin_btn" id="update">수정</div>
						<div class="admin_btn" id="delete">삭제</div>
	   				</div>
				</div>
			</div>
	
			<div class="admin_content_box admin_half_w ">
				<div class="admin_content_form">
					<div>
						<div>객실타입 : ${vo.room_type }</div><br/>
						<div>객실이름 : ${vo.room_name }</div><br/>
						<div>객실가격 : <fmt:formatNumber value="${vo.room_price}" pattern="#,###"/></div>
					</div>
				</div>
				<div class="admin_content_form">
					<div>메인설명</div>
					<div>${vo.room_mdsp }</div>
				</div>
				<div class="admin_content_form">
					<div>부가설명</div>
					<div>${vo.room_sdsp }</div>
				</div>
			</div>
			<div class="admin_content_box admin_half_w ">
				<div class="admin_content_form">
					<div>대표 이미지</div>
					<div><img src="upload/${vo.roomImgList[0]}" onError="this.src='<%=ctx%>/img/no-img.jpg'" style="width:300px;"/></div>
				</div>
				
				<div class="admin_content_form">
					<div>추가 이미지</div>
					<c:forEach var="sub" items="${vo.roomImgList}" begin="1">
						<div style="display:inline-block;padding:5px"><img src="upload/${sub}" onError="this.src='img/no-img.jpg'" style="width:150px;"/></div>
					</c:forEach>
				</div>
			</div>
			<div class="admin_content_box admin_half_w ">
				<div class="admin_content_form">
					<div>일반용품</div>
					<div> 
					${vo.chkBoxGen_01} / ${vo.chkBoxGen_02} 
					/ ${vo.chkBoxGen_03} / ${vo.chkBoxGen_04} 
					/ ${vo.chkBoxGen_05} / ${vo.chkBoxGen_06} 
					/ ${vo.chkBoxGen_07} / ${vo.chkBoxGen_08} 
					/ ${vo.chkBoxGen_09} / ${vo.chkBoxGen_10} 
					/ ${vo.chkBoxGen_11} / ${vo.chkBoxGen_12}
					</div>
				</div> 
			</div>
			
			<div class="admin_content_box admin_half_w ">
				<div class="admin_content_form">
					<div>욕실용품</div>
					<div> 
					${vo.chkBoxBath_01 } / ${vo.chkBoxBath_02 } 
					/ ${vo.chkBoxBath_03 } / ${vo.chkBoxBath_04 } 
					/ ${vo.chkBoxBath_05 } / ${vo.chkBoxBath_06 } 
					/ ${vo.chkBoxBath_07 } / ${vo.chkBoxBath_08 } 
					/ ${vo.chkBoxBath_09}
					</div>
				</div> 
			</div>
			
			<div class="admin_content_box admin_half_w ">
				<div class="admin_content_form">
					<div>기타용품</div>
					<div> 
					${vo.chkBoxEtc_01} / ${vo.chkBoxEtc_02} 
					/ ${vo.chkBoxEtc_03} / ${vo.chkBoxEtc_04} 
					/ ${vo.chkBoxEtc_05} / ${vo.chkBoxEtc_06} 
					/ ${vo.chkBoxEtc_07} 
					</div>
				</div> 
			</div>
		</div>
	</div>
</section>