<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


</head>
<section>
<div id="introduceNewsCenter">
	<!-- 맨위 상단 홈  -->
	<div id="introduceNewsBar">
	 	<span class="introduceNews_home">홈</span> / <span class="introduceNews_home">크라운 호텔 소개</span> / <span class="introduceLocation_home">뉴스</span>
	</div>
	<!-- 메인 센터 -->
	<div>
		<div id="introduceNewsName">뉴스</div>
		
		
		<div id="introduceNewsIdPwd">
		
		<div class="introduceNews_id">
		<ul id="introduceNewsBoardList">
			<li class="introduceNews_li"><b>번호</b></li>
			<li class="introduceNews_li"><b>제목</b></li>
			<li class="introduceNews_li"><b>첨부파일</b></li>
			<li class="introduceNews_li"><b>날짜</b></li>	
			
			<c:forEach var="vo" items="${lst}">
				<li>${vo.no}</li>
				<li><a href="/crown/boardView?no=${vo.no}&pageNum=${pvo.pageNum}
				<c:if test="${pvo.searchKey!=null && pvo.searchWord!=null}">
				&searchKey=${pvo.searchKey}
				&searchWord=${pvo.searchWord}</c:if>">
				${vo.subject}</a>
				</li>
				<li>-</li>
				<li>${vo.writedate}</li>
			</c:forEach>		
		</ul>
		
		<div style="padding-top:310px;">
			<!-- 페이징 -->
			<!-- 현재페이지가 1페이지 일떄 -->
			<ul class="pagination">
		<!-- 현재 페이지가 1페이지 일때 -->
				<c:if test="${pvo.pageNum==1}">
					<li class="page-item disabled"><a class="page-link" href="#">prev</a></li>
				</c:if>
				<!-- 현재 페이지가 1페이지가 아닐 떄 -->
				<c:if test="${pvo.pageNum!=1}">
					<li class="page-item"><a class="page-link" href="<%=ctx %>/boardList/?pageNum=${pvo.pageNum-1}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">prev</a></li>
				</c:if>
				<c:forEach var="i" begin="${pvo.startPage}" end="${pvo.startPage + pvo.onePageCount-1 }">
					<c:if test="${i<=pvo.totalPage}"> 
						<c:if test="${i==pvo.pageNum }">
							<li class="page-item active">
								<a class="page-link" href="<%=ctx %>/boardList?pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">${i}</a>
							</li>
						</c:if>
						<c:if test="${i!=pvo.pageNum }">
							<li class="page-item">
								<a class="page-link" href="<%=ctx %>/boardList?pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">${i}</a>
							</li>
						</c:if>
					</c:if>		
				</c:forEach>
				<c:if test="${pvo.pageNum == pvo.totalPage}">
					  <li class="page-item disabled"><a style="color:black" class="page-link" href="#">next</a></li>
				</c:if>	 
				<c:if test="${pvo.pageNum < pvo.totalPage}"> 
					   <li  class="page-item"><a class="page-link" href="<%=ctx %>/boardList?pageNum=${pvo.pageNum+1}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">next</a></li>
				</c:if>
			</ul>
		</div><!-- 페이징 -->
		
		<div style="position:absolute; top:325px; right:310px;"><!-- 검색 -->
			<form id="searchFrm" method="post" action="<%=request.getContextPath()%>/boardList">
				<select id="introduceNewsSelect" name="searchKey">
					<option value="subject" >제목</option>
					<option value="content">글내용</option>
					
					
				</select>
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" id="introduceNewsButtonSc" value="검색"/>
			</form>
		</div><!-- 검색 -->
			
		
		
	</div>
		
	</div>
		
		
		
		
		
		
		
		
	</div><!-- 메인 센터 -->
</div>
</section>