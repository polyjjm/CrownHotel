<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(function(){
	$(document).on('click', '#btnSearch', function(e){

		e.preventDefault();
		var url = "<%=ctx%>/adminRoomList";
		url = url + "?searchKey=" + $('#searchKey').val();
		url = url + "&searchWord=" + $('#searchWord').val();
		location.href = url;

		
	});	

	$(document).on('keyup','#searchWord',function(e){
		if(e.keyCode == 13){
			var url = "<%=ctx%>/adminRoomList";
			url = url + "?searchKey=" + $('#searchKey').val();
			url = url + "&searchWord=" + $('#searchWord').val();
			location.href = url;
		}
	});
	
});


</script>

<!-- content -->
		<div class="admin_content_wrap">
			<div class="admin_content_top">
				<div class="admin_content_title">
					<h2>객실 리스트 페이지</h2>
				</div>
			</div>
			<div class="admin_content_box">
				<div class="admin_content_form">
					<div class="container">
						<table class="table table-dark table-hover" id="adminRoomListTable">
							<thead>
								<tr>
									<th>객실 코드</th>
									<th>객실 호수</th>
									<th>객실 타입</th>
									<th>객실 이름</th>
									<th>객실 가격</th>
									<th>침대 타입</th>
									<th>최대인원(어른)</th>
									<th>최대인원(아이)</th>
								</tr>
							</thead>
							<tbody id="adminRoomListTbody">
								<c:forEach var="vo" items="${list }">
									<tr onclick="location.href='<%=ctx%>/adminRoomView?room_code=${vo.room_code}'">
										
										<td>${vo.room_code}</td>
										<td>${vo.room_num }&nbsp;<span>호</span></td>
										<td>${vo.room_type }</td>
										<td>${vo.room_name }</td>
										<td><span><span><fmt:formatNumber value="${vo.room_price }" pattern="#,###"/></span><span>&nbsp;&nbsp;원</span></span></td>
										<td>${vo.bed }</td>
										<td>${vo.max_adult }<span>&nbsp;명</span></td>
										<td>${vo.max_child }<span>&nbsp;명</span></td>
										
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
						
						<!-- 페이징 -->
						<div class="page_box">
							<ul class="pagination">
								
								<!-- 현재 페이지가 1페이지 일때 -->
								<c:if test="${pvo.pageNum==1}">
									<li class="page-item disabled"><a class="page-link" href="#"> 이전 </a></li>
								</c:if>
								<!-- 현재 페이지가 1페이지가 아닐 떄 -->
								<c:if test="${pvo.pageNum!=1}">
									<li class="page-item"><a class="page-link" href="<%=ctx%>/adminRoomList?pageNum=${pvo.pageNum-1}<c:if test="${pvo.searchKey!=null && pvo.searchWord!=null }">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">&nbsp;이전&nbsp;</a></li>
								</c:if>
								<!-- 페이지 -->
								<c:forEach var="i" begin="${pvo.startPage}" end="${pvo.startPage + pvo.onePageCount -1}">
									<c:if test="${i <= pvo.totalPage }">
										<c:if test="${i==pvo.pageNum}">
											<li class="page-item active">
												<a class="page-link" href="<%=ctx %>/adminRoomList?pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord!=null }">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">&nbsp;${i}&nbsp;</a>
											</li>
										</c:if>
									
										<c:if test="${i!=pvo.pageNum }">
											<li class="page-item">
												<a class="page-link" href="<%=ctx %>/adminRoomList?pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord!=null }">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">&nbsp;${i}&nbsp;</a>
											</li>
										</c:if>	
									</c:if>
									
								</c:forEach>
								<!-- 현재 페이지가 마지막 일때 -->
								<c:if test="${pvo.pageNum == pvo.totalPage }">
									 <li class="page-item disabled"><a class="page-link" href="#">&nbsp;다음&nbsp;</a></li>
								</c:if>
								<c:if test="${pvo.pageNum < pvo.totalPage }">
									 <li class="page-item"><a class="page-link" href="<%=ctx%>/adminRoomList?pageNum=${pvo.pageNum+1}<c:if test="${pvo.searchKey!=null && pvo.searchWord!=null }">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">&nbsp;다음&nbsp;</a></li>
								</c:if>
							</ul>
						</div><!-- 페이징 -->
						<!-- 검색 -->
						<div class="form-group row justify-content-center">
							<div class="w100" style="padding-right:10px">
								<select class="form-control form-control-sm" name="searchKey" id="searchKey">
									<option value="room_type">객실 타입</option>
									<option value="room_name">객실 이름</option>
									<option value="room_num">객실 호수</option>
								</select>
							</div>
							<div class="w300" style="padding-right:10px">
								<input type="text" class="form-control form-control-sm" name="searchWord" id="searchWord">
							</div>
							<div>
								<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
							</div>
						</div><!-- 검색 -->
						
						
					</div><!-- container : 테이블-->
				</div>
			</div>
		</div>

	</div>
</section>