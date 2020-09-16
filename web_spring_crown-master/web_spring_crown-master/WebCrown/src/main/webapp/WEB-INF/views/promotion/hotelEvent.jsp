<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=ctx %>/css/hotelEvent.css" type="text/css" />
<section>
<div id="mainDiv">
	<div id="title">
		<div id="route">홈&nbsp;&nbsp;/&nbsp;&nbsp;프로모션&nbsp;&nbsp;/&nbsp;&nbsp;호텔 이벤트</div>
	</div>
	<div id="content">
		<div id="contentTitle">
			<h1>호텔 이벤트</h1><br/>
			<p>크라운 호텔에서 준비한 특별한 이벤트</p>
		</div>
		<div id="searchPromotion">
			<b>검색</b>
			<form id="searchForm" method="post" action="<%=ctx%>/hotelEvent">
			<input type="radio" value="event_start" name="searchKey" id="packStart" checked> 시작날짜&nbsp;&nbsp;&nbsp;
			 	<input type="radio" value="event_end" name="searchKey" id="packEnd"> 마감날짜&nbsp;&nbsp;&nbsp;
			 	<input type="date" name="startDate" id="pack_start_search"  maxlength="20"/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="date" name="endDate" id="pack_end_search"/>&nbsp;&nbsp;		
				<input type="submit" id="packSearch" value="검색"/>
			</form>
		</div>
		<br/>
		<ul class="event_list">
			<c:forEach var="aevo" items="${elist}">
			<li class="event">
				<div id="img">
					<a href="<%=ctx%>/eventView?event_code=${aevo.event_code}&pageNum=${aepvo.pageNum}
					<c:if test="${aepvo.searchKey!=null && aepvo.searchWord!=null}">
					&searchKey=${aepvo.searchKey}
					&searchWord=${aepvo.searchWord}</c:if>"><img src="upload/${aevo.img}" class="scale"/></a>
				</div>
				<div id="eventContent">
					<div id="eventTitle">
						<a href="<%=ctx%>/eventView?event_code=${aevo.event_code}"><h2>${aevo.event_name}</h2></a>
						<p>${aevo.event_mdsp}</p>
					</div>
					<div id="eventDate">
						기간 <b>${aevo.event_start}~${aevo.event_end}</b>
						<div id="eventLink">
							<a href="<%=ctx%>/eventView?event_code=${aevo.event_code}"><span>자세히 보기 > </span></a>
						</div>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		<div id="paging">
			<!-- 현재페이지가 1페이지 일떄 -->
			<ul class="pagination justify-content-center">
			<!-- 현재 페이지가 1페이지 일때 -->
				<c:if test="${aepvo.pageNum==1}">
					<li class="page-item disabled"><a class="page-link" href="#">prev</a></li>
				</c:if>
				<!-- 현재 페이지가 1페이지가 아닐 떄 -->
				<c:if test="${aepvo.pageNum!=1}">
					<li class="page-item"><a class="page-link" href="<%=ctx %>/hotelEvent/?pageNum=${aepvo.pageNum-1}<c:if test="${aepvo.searchKey!=null && aepvo.searchWord !=null}">&searchKey=${aepvo.searchKey}&searchWord=${aepvo.searchWord}</c:if>">prev</a></li>
				</c:if>
				<c:forEach var="i" begin="${aepvo.startPage}" end="${aepvo.startPage + aepvo.onePageCount-1 }">
					<c:if test="${i<=aepvo.totalPage}"> 
						<c:if test="${i==aepvo.pageNum }">
							<li class="page-item active">
								<a class="page-link" href="<%=ctx %>/hotelEvent?pageNum=${i}<c:if test="${aepvo.searchKey!=null && aepvo.searchWord !=null}">&searchKey=${aepvo.searchKey}&searchWord=${aepvo.searchWord}</c:if>">${i}</a>
							</li>
						</c:if>
						<c:if test="${i!=aepvo.pageNum }">
							<li class="page-item">
								<a class="page-link" href="<%=ctx %>/hotelEvent?pageNum=${i}<c:if test="${aepvo.searchKey!=null && aepvo.searchWord !=null}">&searchKey=${aepvo.searchKey}&searchWord=${aepvo.searchWord}</c:if>">${i}</a>
							</li>
						</c:if>
					</c:if>		
				</c:forEach>
				<c:if test="${aepvo.pageNum == aepvo.totalPage}">
					  <li class="page-item disabled"><a style="color:black" class="page-link" href="#">next</a></li>
				</c:if>	 
				<c:if test="${aepvo.pageNum < aepvo.totalPage}"> 
					   <li  class="page-item"><a class="page-link" href="<%=ctx %>/hotelEvent?pageNum=${aepvo.pageNum+1}<c:if test="${aepvo.searchKey!=null && aepvo.searchWord !=null}">&searchKey=${aepvo.searchKey}&searchWord=${aepvo.searchWord}</c:if>">next</a></li>
				</c:if>
			</ul>
		</div><!-- 페이징 -->
		<div style="clear:both"></div>
	</div>
</div>
</section>
</body>
</html>