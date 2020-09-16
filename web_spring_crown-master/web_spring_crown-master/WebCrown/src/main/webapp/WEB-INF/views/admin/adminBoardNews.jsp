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
			<div class="admin_content_top">
				<div class="admin_content_title">
					<h2>관리자 뉴스목록 뷰</h2>
					<div class="admin_btn_box">
						<button type="button"  onclick="location.href='/crown/admin/boardList'" class="admin_btn" >목록</button>
						<div class="admin_btn" id="adminBoardViewUpdate"><a href="<%=ctx %>/boardEdit?no=${vo.no}" >수정</a></div>
						<div class="admin_btn" id="adminBoardViewDelete"><a href="javascript:delCheck(${vo.no})">삭제</a></div>
	   				</div>
				</div>
			</div>
		<div class="admin_content_box">
				<div class="admin_content_form">		
					<div>
						<div>제목 :<b>${vo.subject}</b></div>
					</div>
				</div>
				<div class="admin_content_form">
					<div>
						<div>내용 :<b>${vo.content}</b></div>
					</div>
				</div>
				<div class="admin_content_form">
					<div>
						<div>날짜 :<b>${vo.writedate}</b></div>
					</div>
				</div>
			</div>
		</div>
</section>