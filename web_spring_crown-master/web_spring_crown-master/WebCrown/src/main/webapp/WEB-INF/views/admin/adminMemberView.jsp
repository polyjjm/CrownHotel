<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<script>
	
	function delCheck(member_code){
		if(confirm("삭제하시겠습니끼?")){
			location.href="<%=ctx%>/adminMemberDelete?member_code="+member_code;
		}
	}
	
	
</script>


		<!-- content -->
		<div class="admin_content_wrap">
			<div class="admin_content_top">
				<div class="admin_content_title">
				<h2>관리자 회원정보</h2>
				<div class="admin_btn_box">
					<button type="button"  onclick="location.href='<%=ctx%>/adminMember'" class="admin_btn">목록</button>
					<div class="admin_btn"><a href="<%=ctx%>/adminMemberEdit?member_code=${vo.member_code}" style="color:#fff">수정</a></div>
					<div class="admin_btn"><a href="javascript:delCheck(${vo.member_code})" style="color:#fff">삭제</a></div>
				</div>
				
				</div>
			</div>
			
	<div class="admin_content_box admin_half_w ">
		<div class="admin_content_form">
			
				<!-- 뷰페이지 -->
			<div class="admin_input_frm">
				<div>번호</div>
					<div>${vo.member_code}</div>
			</div><hr/>
				
			<div class="admin_input_frm">
				<div>성명</div>
					<div>${vo.user_name }</div>
			</div><hr/>
				
			<div class="admin_input_frm">
				<div>국가</div>
					<div>${vo.country}</div>
			</div><hr/>
			
			<div class="admin_input_frm">
				<div>연락처</div>
					<div>${vo.user_tel }</div>
			</div><hr/>	
			
			<div class="admin_input_frm">
				<div>이메일</div>
					<div>${vo.user_email}</div>
			</div><hr/>
			
			<div class="admin_input_frm">
				<div>생년월일</div>
					<div>${vo.birthday }</div>
			</div><hr/>
			
			<div class="admin_input_frm">
				<div>아이디</div>
					<div>${vo.user_id}</div>
			</div><hr/>
			<div class="admin_input_frm">
				<div>비밀번호</div>
					<div>${vo.user_pwd }</div>
			</div><hr/>
			<div class="admin_input_frm">
				<div>등록일</div>
					<div>${vo.regdate }</div>
			</div><hr/>
			<div class="admin_btn"><a href="<%=ctx%>/adminPointList?user_id=${vo.user_id}" style="color:#fff">포인트조회</a></div>
			
			</div><!-- 뷰페이지 -->
		<!-- 글내용 -->
	
		</div>
	</div>
		
		
		
		
		
		
</section>