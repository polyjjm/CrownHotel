<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<%=ctx %>/css/admin.css" type="text/css"/>
	<div class="admin_content_wrap">
		<div class="admin_content_top">
			<div class="admin_content_title">
				<h2>호텔 이벤트 리스트</h2>
				<div class="admin_btn_box">
					<a href="<%=ctx%>/adminEventAdd"><input class="admin_btn" type="submit" value="등록"/></a>
   				</div>
			</div>
		</div>
		<div class="admin_content_box">
			<div class="admin_content_form">
				<div>등록된 이벤트 목록</div>
				<ul class="admin_event_list">
					<li>번호</li>
					<li>제목</li>
					<li>내용</li>
					<li>이미지</li>
					<li>기간</li>
					<c:forEach var="aevo" items="${elist}">
						<li>${aevo.event_code}</li>
						<li class="word_cut_name"><a href="<%=ctx%>/adminEventView?event_code=${aevo.event_code}">${aevo.event_name}</a></li>
						<li><div class="word_cut_dsp">${aevo.event_mdsp}</div></li>
						<li><img src="<%=ctx%>/upload/${aevo.img}" style="width:110px; height:50px; padding:5px"/></li>
						<li>${aevo.event_start} ~ ${aevo.event_end}</li>
					</c:forEach>
				</ul>
				<div id="paging">
					<ul class="pagination justify-content-center">
					<!-- 현재 페이지가 1페이지 일때 -->
					<c:if test="${aepvo.pageNum==1}">
						<li class="page-item disabled"><a class="page-link" href="#">prev</a></li>
					</c:if>
					<!-- 현재 페이지가 1페이지가 아닐 떄 -->
					<c:if test="${aepvo.pageNum!=1}">
						<li class="page-item"><a class="page-link" href="<%=ctx %>/adminEventList/?pageNum=${aepvo.pageNum-1}<c:if test="${aepvo.searchKey!=null && aepvo.searchWord !=null}">&searchKey=${aepvo.searchKey}&searchWord=${aepvo.searchWord}</c:if>">prev</a></li>
					</c:if>
					<c:forEach var="i" begin="${aepvo.startPage}" end="${aepvo.startPage + aepvo.onePageCount-1 }">
						<c:if test="${i<=aepvo.totalPage}"> 
							<c:if test="${i==aepvo.pageNum }">
								<li class="page-item active">
									<a class="page-link" href="<%=ctx %>/adminEventList?pageNum=${i}<c:if test="${aepvo.searchKey!=null && aepvo.searchWord !=null}">&searchKey=${aepvo.searchKey}&searchWord=${aepvo.searchWord}</c:if>">${i}</a>
								</li>
							</c:if>
							<c:if test="${i!=aepvo.pageNum }">
								<li class="page-item">
									<a class="page-link" href="<%=ctx %>/adminEventList?pageNum=${i}<c:if test="${aepvo.searchKey!=null && aepvo.searchWord !=null}">&searchKey=${aepvo.searchKey}&searchWord=${aepvo.searchWord}</c:if>">${i}</a>
								</li>
							</c:if>
						</c:if>		
					</c:forEach>
					<c:if test="${aepvo.pageNum == aepvo.totalPage}">
						  <li class="page-item disabled"><a style="color:black" class="page-link" href="#">next</a></li>
					</c:if>	 
					<c:if test="${aepvo.pageNum < aepvo.totalPage}"> 
					   <li  class="page-item"><a class="page-link" href="<%=ctx %>/adminEventList?pageNum=${aepvo.pageNum+1}<c:if test="${aepvo.searchKey!=null && aepvo.searchWord !=null}">&searchKey=${aepvo.searchKey}&searchWord=${aepvo.searchWord}</c:if>">next</a></li>
					</c:if>
					</ul>
				</div><!-- 페이징 -->
				<div style="clear:both"></div>
			</div>
		</div>
	</div>
</div>
</section>