<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<%=ctx %>/css/admin.css" type="text/css"/>
	<div class="admin_content_wrap">
		<div class="admin_content_top">
			<div class="admin_content_title">
				<h2>호텔 패키지 리스트</h2>
				<div class="admin_btn_box">
					<a href="<%=ctx%>/adminPackageAdd"><input class="admin_btn" type="submit" value="등록"/></a>
   				</div>
			</div>
		</div>
		<div class="admin_content_box">
			<div class="admin_content_form">
				<div>등록된 패키지 목록</div>
				<ul class="admin_package_list">
					<li>번호</li>
					<li>제목</li>
					<li>내용</li>
					<li>이미지</li>
					<li>가격</li>
					<li>기간</li>
					<c:forEach var="apvo" items="${plist}">
						<li>${apvo.pack_code}</li>
						<li class="word_cut_name"><a href="<%=ctx%>/adminPackView?pack_code=${apvo.pack_code}">${apvo.pack_name}</a></li>
						<li><div class="word_cut_dsp">${apvo.dsp}</div></li>
						<li><img src="<%=ctx%>/upload/${apvo.img}" style="width:110px; height:50px; padding:5px"/></li>
						<li>KRW <fmt:formatNumber pattern="###,###,###" value="${apvo.pack_price}"></fmt:formatNumber>~</li>
						<li>${apvo.pack_start} ~ ${apvo.pack_end}</li>
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
						<li class="page-item"><a class="page-link" href="<%=ctx %>/adminPackageList?pageNum=${appvo.pageNum-1}<c:if test="${appvo.searchKey!=null && appvo.searchWord !=null}">&searchKey=${appvo.searchKey}&searchWord=${appvo.searchWord}</c:if>">prev</a></li>
					</c:if>
					<c:forEach var="i" begin="${appvo.startPage}" end="${appvo.startPage + appvo.onePageCount-1 }">
						<c:if test="${i<=appvo.totalPage}"> 
							<c:if test="${i==appvo.pageNum }">
								<li class="page-item active">
									<a class="page-link" href="<%=ctx %>/adminPackageList?pageNum=${i}<c:if test="${appvo.searchKey!=null && appvo.searchWord !=null}">&searchKey=${appvo.searchKey}&searchWord=${appvo.searchWord}</c:if>">${i}</a>
								</li>
							</c:if>
							<c:if test="${i!=appvo.pageNum }">
								<li class="page-item">
									<a class="page-link" href="<%=ctx %>/adminPackageList?pageNum=${i}<c:if test="${appvo.searchKey!=null && appvo.searchWord !=null}">&searchKey=${appvo.searchKey}&searchWord=${appvo.searchWord}</c:if>">${i}</a>
								</li>
							</c:if>
						</c:if>		
					</c:forEach>
					<c:if test="${appvo.pageNum == appvo.totalPage}">
						  <li class="page-item disabled"><a style="color:black" class="page-link" href="#">next</a></li>
					</c:if>	 
					<c:if test="${appvo.pageNum < appvo.totalPage}"> 
						<li  class="page-item"><a class="page-link" href="<%=ctx %>/adminPackageList?pageNum=${appvo.pageNum+1}<c:if test="${appvo.searchKey!=null && appvo.searchWord !=null}">&searchKey=${appvo.searchKey}&searchWord=${appvo.searchWord}</c:if>">next</a></li>
					</c:if>
				</ul>
				</div><!-- 페이징 -->
				<div style="clear:both"></div>
			</div>
		</div>
	</div>
</div>
</section>