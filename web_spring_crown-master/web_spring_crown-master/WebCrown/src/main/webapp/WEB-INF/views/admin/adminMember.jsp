<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!-- content -->
		<div class="admin_content_wrap">
			<div class="admin_content_top">
				<div class="admin_content_title"><h2>관리자 회원 목록 리스트</h2></div>
				
			<div id="introduceNewsIdPwd">
				<div class="introduceNews_id">
				
				<table class="table">
					    <thead class="thead-light">
					      <tr class="admin_board_list_title">
					        <th>번호</th>
					        <th>아이디</th>
					        <th>성명</th>
					        <th>날짜</th>
					      </tr>
					    </thead>
					    <tbody>
					    <c:forEach var="vo" items="${list}">
					      <tr class="admin_board_list_line" onclick="location.href='<%=ctx%>/adminMemberView?member_code=${vo.member_code}'">
					        <td>${vo.member_code}</td>
					        <td>${vo.user_id}</td>
					        <td>${vo.user_name}</td>
					        <td>${vo.regdate}</td>
					      </tr>
					     </c:forEach>
					    </tbody>
				</table>
				
				
		<!-- 뷰페이지 -->
		
		<div>
			<!-- 페이징 -->
			<!-- 현재페이지가 1페이지 일떄 -->
			<ul class="pagination">
		<!-- 현재 페이지가 1페이지 일때 -->
				<c:if test="${pvo.pageNum==1}">
					<li class="page-item disabled"><a class="page-link" href="#">prev</a></li>
				</c:if>
				<!-- 현재 페이지가 1페이지가 아닐 떄 -->
				<c:if test="${pvo.pageNum!=1}">
					<li class="page-item"><a class="page-link" href="<%=ctx %>/adminMember?pageNum=${pvo.pageNum-1}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">prev</a></li>
				</c:if>
				<c:forEach var="i" begin="${pvo.startPage}" end="${pvo.startPage + pvo.onePageCount-1 }">
					<c:if test="${i<=pvo.totalPage}"> 
						<c:if test="${i==pvo.pageNum }">
							<li class="page-item active">
								<a class="page-link" href="<%=ctx %>/adminMember?pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">${i}</a>
							</li>
						</c:if>
						<c:if test="${i!=pvo.pageNum }">
							<li class="page-item">
								<a class="page-link" href="<%=ctx %>/adminMember?pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">${i}</a>
							</li>
						</c:if>
					</c:if>		
				</c:forEach>
				<c:if test="${pvo.pageNum == pvo.totalPage}">
					  <li class="page-item disabled"><a style="color:black" class="page-link" href="#">next</a></li>
				</c:if>	 
				<c:if test="${pvo.pageNum < pvo.totalPage}"> 
					   <li  class="page-item"><a class="page-link" href="<%=ctx %>/adminMember?pageNum=${pvo.pageNum+1}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">next</a></li>
				</c:if>
			</ul>
		</div><!-- 페이징 -->
		<!-- 뷰페이지 -->		
		
	
		
	
	
	
	</div><!-- 메인 센터 -->
		<div class="admin_board_search_frm"><!-- 검색 -->
			<form id="searchFrm" method="get" action="<%=ctx%>/adminMember">
				<select id="introduceNewsSelect" name="searchKey">
					<option value="user_name">성명</option>
					<option value="user_id">아이디</option>
					
					
				</select>
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" id="introduceNewsButtonSc" value="검색"/>
			</form>
		</div><!-- 검색 -->		
				
				
			</div>
			<div class="admin_content_box"></div>
		</div>
	</div>
		
		
		
		
		
		
</section>