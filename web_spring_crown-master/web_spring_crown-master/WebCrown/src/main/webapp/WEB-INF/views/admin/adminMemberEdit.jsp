<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

	function delCheck(no){
		if(confirm("삭제하시겠습니끼?")){
			location.href="/crown/boardDel?no="+no;
		}
	}
</script>

		<!-- content -->
		<div class="admin_content_wrap">
			<form method="post" action="<%=ctx%>/adminMemberEditOk">	
			<div class="admin_content_top">
				<div class="admin_content_title">
					<h2>관리자 회원정보 수정</h2>
					<div class="admin_btn_box">
					<input type="submit" value="글수정" class="admin_btn"/>
					</div>
				</div>
			</div>
			
			<div class="admin_content_box admin_half_w ">
				<div class="admin_content_form">
					
					
			<input type="hidden" name="member_code" value="${vo.member_code }"/>
					<div class="admin_input_frm">
			<div>성명</div>
			<input type="text" name="user_name" value="${vo.user_name }" style="width:55%"/>
					</div><hr/>
					
					<div class="admin_input_frm">
			<div>국가</div>
			<input type="text" name="country" value="${vo.country }" style="width:55%"/>
					</div><hr/>
			
					<div class="admin_input_frm">
			<div>연락처</div>
			<input type="text" name="user_tel" value="${vo.user_tel }" style="width:55%"/>
					</div><hr/>
					
					<div class="admin_input_frm">
			<div>이메일</div>
			<input type="text" name="user_email" value="${vo.user_email }" style="width:55%"/>
					</div><hr/>
					
					<div class="admin_input_frm">
			<div>생년월일</div>
			<input type="text" name="birthday" value="${vo.birthday }" style="width:55%"/>
					</div><hr/>
					
					<div class="admin_input_frm">
			<div>아이디</div>
			<input type="text" name="user_id" value="${vo.user_id }" style="width:55%"/>
					</div><hr/>
					
					<div class="admin_input_frm">
			<div>비밀번호</div>
			<input type="text" name="user_pwd" value="${vo.user_pwd }" style="width:55%"/>
					</div>
					
				</div>
			</div>
		</form>
		</div><!-- content -->
	

		
		
		
		
	</div>
</section>