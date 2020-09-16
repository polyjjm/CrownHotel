<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!-- content -->
		<div class="admin_content_wrap">
			<div class="admin_content_top">
				<div class="admin_content_title"><h2>포인트 페이지</h2></div>
			
				<div class="introduceNews_id">
		<ul id="introduceNewsBoardList1">
			<li class="introduceNews_li"><b>번호</b></li>
			<li class="introduceNews_li"><b>포인트</b></li>
			<li class="introduceNews_li"><b>아이디</b></li>
			<li class="introduceNews_li"><b>내용</b></li>	
			<li class="introduceNews_li"><b>날짜</b></li>
			<c:forEach var="vo" items="${list2}"><!-- var에 vo값은 변수명, items에 list가 컨트롤러랑 일치 -->
				<li>${vo.point_code}</li>
				<!--<li><a href="/crown/admin/adminPointList?point_code=${vo.point_code}&pageNum=${pageVO.pageNum}
				<c:if test="${pageVO.searchKey!=null && pageVO.searchWord!=null}">
				&searchKey=${pageVO.searchKey}
				&searchWord=${pageVO.searchWord}</c:if>">
				${vo.point}</a>
				</li> -->
				<li>${vo.point}</li>
				<li>${vo.user_id}</li>
				<li>${vo.point_name}</li>
				<li>${vo.point_date}</li>
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
					<li class="page-item"><a class="page-link" href="<%=ctx %>/admin/adminPointList/?pageNum=${pvo.pageNum-1}">prev</a></li>
				</c:if>
				<c:forEach var="i" begin="${pvo.startPage}" end="${pvo.startPage + pvo.onePageCount-1 }">
					<c:if test="${i<=pvo.totalPage}"> 
						<c:if test="${i==pvo.pageNum }">
							<li class="page-item active">
								<a class="page-link" href="<%=ctx %>/admin/adminPointList?pageNum=${i}">${i}</a>
							</li>
						</c:if>
						<c:if test="${i!=pvo.pageNum }">
							<li class="page-item">
								<a class="page-link" href="<%=ctx %>/admin/adminPointList?pageNum=${i}">${i}</a>
							</li>
						</c:if>
					</c:if>		
				</c:forEach>
				<c:if test="${pvo.pageNum == pvo.totalPage}">
					  <li class="page-item disabled"><a style="color:black" class="page-link" href="#">next</a></li>
				</c:if>	 
				<c:if test="${pvo.pageNum < pvo.totalPage}"> 
					   <li  class="page-item"><a class="page-link" href="<%=ctx %>/admin/adminPointList?pageNum=${pvo.pageNum+1}">next</a></li>
				</c:if>
			</ul>
		</div><!-- 페이징 -->
		
		<div><!-- 검색 -->
			
			<!--<form id="searchFrm" method="post" action="<%=request.getContextPath()%>/adminPointList">
				<select id="introduceNewsSelect" name="searchKey">
					<option value="user_id" <c:if test="${map.searchKey == 'user_id'}">selected</c:if>>아이디</option>
				</select>
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" id="introduceNewsButtonSc" value="검색"/>
			</form> -->
		</div><!-- 검색 -->
			
		
		
	</div>
			
			
			
			</div>
			<div class="admin_content_box"></div>
		</div>
	</div>	
</section>