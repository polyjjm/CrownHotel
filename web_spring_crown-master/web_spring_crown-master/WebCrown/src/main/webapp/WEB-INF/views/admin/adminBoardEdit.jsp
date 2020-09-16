<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function delCheck(no){
		if(confirm("삭제하시겠습니끼?")){
			location.href="/crown/boardDel?no="+no;
		}
	}
	
	
	$(function(){
		
		CKEDITOR.replace('content',{
			filebrowserUploadUrl : '<%=ctx%>/imageUpload'
		});
	});

	
	
</script>

		<!-- content -->
		<div class="admin_content_wrap">
			<form method="post" action="/crown/boardEditOk">
				<div class="admin_content_top">
					<div class="admin_content_title">
						<h2>관리자 뉴스 글수정</h2>
						<div class="admin_btn_box">
							<input class="admin_btn" type="submit" value="글수정" />
						</div>
					</div>
				</div>
		<div class="admin_content_box admin_half_w ">	
			<div class="admin_content_form">
				<div class="admin_input_frm">
					<input type="hidden" name="no" value="${vo.no }"/>
					<div  style="width:25%;padding:0 10px;float:left">제목</div>
					<input type="text" name="subject" value="${vo.subject }" style="width:55%;"/>
				</div>
				<hr/>
				<div class="admin_input_frm" style="padding:10px 0 0 0">
					글내용
					<textarea cols="50" rows="5" class="cont" name="content" id="content" style="width:55%;">${vo.content }</textarea>
				</div>
			</div>
		</div>	
	</form>
	</div><!-- content -->
	</div>
</section>