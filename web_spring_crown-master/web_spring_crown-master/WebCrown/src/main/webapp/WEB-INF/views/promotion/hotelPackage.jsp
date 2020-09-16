<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=ctx %>/css/hotelPackage.css" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<section>
<div id="mainDiv">
	<div id="title">
		<div id="route">홈&nbsp;&nbsp;/&nbsp;&nbsp;프로모션&nbsp;&nbsp;/&nbsp;&nbsp;호텔 패키지</div>
	</div>
	<div id="content">
		<div id="contentTitle">
			<h1>호텔 패키지</h1><br/>
			<p>크라운 호텔에서 만날 수 있는 특별한 패키지 상품</p>
		</div>
		<div id="searchPromotion">
			<b>검색</b>
			<form id="searchForm" method="post" action="<%=ctx%>/hotelPackage">
				<input type="radio" value="pack_start" name="searchKey" id="packStart" checked> 시작날짜&nbsp;&nbsp;&nbsp;
			 	<input type="radio" value="pack_end" name="searchKey" id="packEnd"> 마감날짜&nbsp;&nbsp;&nbsp;
				<input type="date" name="startDate" id="pack_start_search"/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="date" name="endDate" id="pack_end_search"/>&nbsp;&nbsp;		
				<input type="submit" id="packSearch" value="검색"/>
			</form>
		</div><br/>
		<ul class="package_list">
			<c:forEach var="apvo" items="${plist}">
			<li class="package">
				<div id="img">
					<a href="<%=ctx%>/packageView?pack_code=${apvo.pack_code}"><img src="upload/${apvo.img}" class="scale"/></a>
				</div>
				<div id="packageContent">
					<div id="packageTitle">
						<a href="<%=ctx%>/packageView?pack_code=${apvo.pack_code}&pageNum=${appvo.pageNum}
						<c:if test="${appvo.searchKey!=null && appvo.searchWord!=null}">
						&searchKey=${appvo.searchKey}
						&searchWord=${appvo.searchWord}</c:if>"><h2>${apvo.pack_name}</h2></a>
						<p>${apvo.room_type}
						<c:if test="${apvo.chkBoxOp1 != null && apvo.chkBoxOp1=='SUN-FRI ONLY'}">
							| SUN-FRI ONLY 
						</c:if>
						<c:if test="${apvo.chkBoxOp2 != null && apvo.chkBoxOp2=='SAT ONLY'}">
							| SAT ONLY 
						</c:if>
						<c:if test="${apvo.chkBoxOp3 != null && apvo.chkBoxOp3=='조식'}">
							| 조식 
						</c:if>
						<c:if test="${apvo.chkBoxOp4 != null && apvo.chkBoxOp4=='석식'}">
							| 석식 
						</c:if>
						<c:if test="${apvo.chkBoxOp5 != null && apvo.chkBoxOp5=='키즈'}">
							| 키즈 
						</c:if>
						<c:if test="${apvo.chkBoxOp6 != null && apvo.chkBoxOp6=='성인'}">
							| 성인 
						</c:if>
						<c:if test="${apvo.chkBoxOp7 != null && apvo.chkBoxOp7=='시즌'}">
							| 시즌
						</c:if>
						</p>
					</div>
					<div id="packageDate">
						기간 <b>${apvo.pack_start}~${apvo.pack_end}</b>
						<div id="packageLink">
							<a href="<%=ctx%>/packageView?pack_code=${apvo.pack_code}"><span>자세히 보기 > </span></a>
						</div>
					</div>
				</div>
				<div id="packagePrice">
						<span>KRW</span>
						<strong><fmt:formatNumber pattern="###,###,###" value="${apvo.pack_price}"></fmt:formatNumber>~</strong>
				</div>
			</li>
			</c:forEach>
		</ul>
		<div id="paging">
			<!-- 현재페이지가 1페이지 일떄 -->
			<ul class="pagination justify-content-center">
			<!-- 현재 페이지가 1페이지 일때 -->
				<c:if test="${appvo.pageNum==1}">
					<li class="page-item disabled"><a class="page-link" href="#">prev</a></li>
				</c:if>
				<!-- 현재 페이지가 1페이지가 아닐 떄 -->
				<c:if test="${appvo.pageNum!=1}">
					<li class="page-item"><a class="page-link" href="<%=ctx %>/hotelPackage/?pageNum=${appvo.pageNum-1}<c:if test="${appvo.searchKey!=null && appvo.searchWord !=null}">&searchKey=${appvo.searchKey}&searchWord=${appvo.searchWord}</c:if>">prev</a></li>
				</c:if>
				<c:forEach var="i" begin="${appvo.startPage}" end="${appvo.startPage + appvo.onePageCount-1 }">
					<c:if test="${i<=appvo.totalPage}"> 
						<c:if test="${i==appvo.pageNum }">
							<li class="page-item active">
								<a class="page-link" href="<%=ctx %>/hotelPackage?pageNum=${i}<c:if test="${appvo.searchKey!=null && appvo.searchWord !=null}">&searchKey=${appvo.searchKey}&searchWord=${appvo.searchWord}</c:if>">${i}</a>
							</li>
						</c:if>
						<c:if test="${i!=appvo.pageNum }">
							<li class="page-item">
								<a class="page-link" href="<%=ctx %>/hotelPackage?pageNum=${i}<c:if test="${appvo.searchKey!=null && appvo.searchWord !=null}">&searchKey=${appvo.searchKey}&searchWord=${appvo.searchWord}</c:if>">${i}</a>
							</li>
						</c:if>
					</c:if>		
				</c:forEach>
				<c:if test="${appvo.pageNum == appvo.totalPage}">
					  <li class="page-item disabled"><a style="color:black" class="page-link" href="#">next</a></li>
				</c:if>	 
				<c:if test="${appvo.pageNum < appvo.totalPage}"> 
					   <li  class="page-item"><a class="page-link" href="<%=ctx %>/hotelPackage?pageNum=${appvo.pageNum+1}<c:if test="${appvo.searchKey!=null && appvo.searchWord !=null}">&searchKey=${appvo.searchKey}&searchWord=${appvo.searchWord}</c:if>">next</a></li>
				</c:if>
			</ul>
		</div><!-- 페이징 -->
		<div style="clear:both"></div>
	</div>
</div>
</section>
</body>
</html>