<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(function(){
	
	CKEDITOR.replace('content',{
		filebrowserUploadUrl : '<%=ctx%>/imageUpload'
	});
});

</script>
		<!-- content -->
		<div class="admin_content_wrap">
			<form method="post" action="/crown/boardWriteOk">
			<div class="admin_content_top">
				<div class="admin_content_title">
					<h2>관리자 뉴스 등록</h2>
					<div class="admin_btn_box">
						<input type="submit" value="글등록" class="admin_btn" />
					</div>
				</div>
			</div>
		
		<div class="admin_content_box admin_half_w ">
			<div class="admin_content_form">
				<div class="admin_input_frm">
					<div>제목</div>
					<input type="text" name="subject" style="width:55%;"/>
				</div>
				<hr/>
				<div class="admin_input_frm" style="padding:10px 0 0 0">
					글내용
					<textarea name="content" id="content" rows="5" cols="50" class="cont" style="width:55%;"></textarea>
				</div>
			</div>
		</div>
	
		</form>
		</div><!-- content -->



		<!-- 
		<div class="admin_content_wrap" style="width:700px;height:370px;border:1px solid gray">
			<div class="admin_content_top">
				<div class="admin_content_title"><h2>공지사항 등록  페이지</h2></div>
			</div>
			<div class="admin_content_box"></div>
		<h1>글쓰기</h1>
		
		<form method="post" action="/crown/boardWriteOk">
		<div id="adminBoardWriteSubCon">
			<div id="adminBoardWriteSubject">
			제목<input type="text" name="subject" style="margin-left:50px;"/><br/>
			</div>
			<hr/>
			<div id="adminBoardWriteContent">
			<span id="adminBoardWriteContentSpan">글내용</span><textarea name="content" rows="5" cols="50" style="margin-left:50px"></textarea>
			</div>
			<input type="submit" value="글등록" id="adminBoardWriteBtn"/>
		</div>	
		</form>
		</div> content -->
	
	
	



	
	</div>
</section>