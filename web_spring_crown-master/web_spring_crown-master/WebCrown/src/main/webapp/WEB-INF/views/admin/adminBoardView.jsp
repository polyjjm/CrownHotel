<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!-- content -->
		<div class="admin_content_wrap">
			<div class="admin_content_top">
				<div class="admin_content_title"><h2>관리자 뉴스 목록</h2></div>
			
				<div class="introduceNews_id">
					<table class="table">
					    <thead class="thead-light">
					      <tr class="admin_board_list_title">
					        <th>번호</th>
					        <th>제목</th>
					        <th>첨부파일</th>
					        <th>날짜</th>
					      </tr>
					    </thead>
					    <tbody>
					    <c:forEach var="vo" items="${lst}">
					      <tr class="admin_board_list_line" onclick="location.href='<%=ctx%>/admin/boardView?no=${vo.no}'">
					        <td>${vo.no}</td>
					        <td>${vo.subject}</td>
					        <td></td>
					        <td>${vo.writedate}</td>
					      </tr>
					     </c:forEach>
					    </tbody>
					  </table>
					  
					  <!-- 페이징 -->
					  <div>
							<!-- 현재페이지가 1페이지 일떄 -->
							<ul class="pagination">
							<!-- 현재 페이지가 1페이지 일때 -->
								<c:if test="${pvo.pageNum==1}">
									<li class="page-item disabled"><a class="page-link" href="#">prev</a></li>
								</c:if>
								<!-- 현재 페이지가 1페이지가 아닐 떄 -->
								<c:if test="${pvo.pageNum!=1}">
									<li class="page-item"><a class="page-link" href="<%=ctx %>/admin/boardList/?pageNum=${pvo.pageNum-1}">prev</a></li>
								</c:if>
								<c:forEach var="i" begin="${pvo.startPage}" end="${pvo.startPage + pvo.onePageCount-1 }">
									<c:if test="${i<=pvo.totalPage}"> 
										<c:if test="${i==pvo.pageNum }">
											<li class="page-item active">
												<a class="page-link" href="<%=ctx %>/admin/boardList?pageNum=${i}">${i}</a>
											</li>
										</c:if>
										<c:if test="${i!=pvo.pageNum }">
											<li class="page-item">
												<a class="page-link" href="<%=ctx %>/admin/boardList?pageNum=${i}">${i}</a>
											</li>
										</c:if>
									</c:if>		
								</c:forEach>
								<c:if test="${pvo.pageNum == pvo.totalPage}">
									  <li class="page-item disabled"><a style="color:black" class="page-link" href="#">next</a></li>
								</c:if>	 
								<c:if test="${pvo.pageNum < pvo.totalPage}"> 
									   <li  class="page-item"><a class="page-link" href="<%=ctx %>/admin/boardList?pageNum=${pvo.pageNum+1}">next</a></li>
								</c:if>
							</ul>
						</div><!-- 페이징 -->
				
						<div class="admin_board_search_frm"><!-- 검색 -->
							<form id="searchFrm" method="post" action="<%=request.getContextPath()%>/admin/boardList">
								<select id="introduceNewsSelect" name="searchKey">
									<option value="subject" <c:if test="${map.searchKey == 'subject'}">selected</c:if>>제목</option>
									<option value="content" <c:if test="${map.searchKey == 'content'}">selected</c:if>>글내용</option>
									
									
								</select>
								<input type="text" name="searchWord" id="searchWord"/>
								<input type="submit" id="introduceNewsButtonSc" value="검색"/>
							</form>
						</div><!-- 검색 -->

					</div>

			</div>
		</div>
	</div>	
</section>