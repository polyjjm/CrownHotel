<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	function logout(){
		
	}
	
	function delCheck(no){
		if(confirm("삭제하시겠습니끼?")){
			location.href="/crown/boardDel?no="+no;
		}
	}
	
	
</script>
<section>
<div id="introduceNewsViewCenter">
	<!-- 맨위 상단 홈  -->
	<div id="introduceNewsViewBar">
	 	<span class="introduceNewsView_home">홈</span> / <span class="introduceNewsView_home">크라운 호텔 소개</span> / <span class="introduceLocation_home">뉴스</span>
	</div>
	<!-- 메인 센터 -->
	<div id="introduceNewsViewMain">
		<div id="introduceNewsViewName">뉴스</div>
		<!-- 뷰페이지 -->
		<div>
			<ul id="introduceNewsViewBoardList">
			<li id="introduceNewsViewLiSubject"><b>${vo.subject}</b></li>
			<li id="introduceNewsViewLiDate"><b>${vo.writedate }</b></li>
			</ul>
		</div><!-- 뷰페이지 -->
		<!-- 글내용 -->
		<div id="introduceNewsViewContent">${vo.content}</div>
		<hr/ id="introduceNewsViewHr" style="width:1150px">
		<!-- 목록 버튼 -->
		<button type="button"  onclick="location.href='/crown/boardList'" id="introduceNewsViewBtn">목록</button>
	
	
	<!--<a href="/crown/boardEdit?no=${vo.no }">수정</a>
	<a href="javascript:delCheck(${vo.no})">삭제</a> -->
	
	
	</div><!-- 메인 센터 -->
</div>
</section>


