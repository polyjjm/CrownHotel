<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).on('click', '#btnSearch', function(e){

	e.preventDefault();
	var url = "<%=ctx%>/adminRoomTypeList";
	url = url + "?searchKey=" + $('#searchKey').val();
	url = url + "&searchWord=" + $('#searchWord').val();
	location.href = url;

	
});	

$(document).on('keyup','#searchWord',function(e){
	if(e.keyCode == 13){
		var url = "<%=ctx%>/adminRoomTypeList";
		url = url + "?searchKey=" + $('#searchKey').val();
		url = url + "&searchWord=" + $('#searchWord').val();
		location.href = url;
	}
});

</script>

	<!-- content -->
	<div class="admin_content_wrap">
		<div class="admin_content_top">
			<div class="admin_content_title">
				<h2>객실 타입 목록 페이지</h2>
				<!-- <div class="admin_btn_box">
	  				<input class="admin_btn" type="submit" id="update" value="수정"/>
	  				<input class="admin_btn" type="submit" id="delete" value="삭제"/>
   				</div> -->
			</div>
		</div>
		
		<div class="admin_content_box">
		
			<div class="admin_content_form">
				 <table class="table">
				    <thead class="thead-light">
				      <tr id="adminRoomTypeListTitle">
				        <th>객실타입코드</th>
				        <th>객실타입</th>
				        <th>객실이름</th>
				        <th>메인이미지</th>
				        <th>메인설명</th>
				        <th>객실가격</th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:forEach var="vo" items="${list}">
				      <tr  class="admin_room_type_list" onclick="location.href='<%=ctx%>/adminRoomTypeView?room_type_code=${vo.room_type_code}'">
				        <td>${vo.room_type_code }</td>
				        <td>${vo.room_type }</td>
				        <td>${vo.room_name }</td>
				        <td><img src="<%=ctx%>/upload/${vo.roomImgList[0]}" onError="this.src='<%=ctx%>/img/no-img.jpg'"/></td>
				        <td><div>${vo.room_mdsp}</div></td>
				        <td><fmt:formatNumber value="${vo.room_price}" pattern="#,###"/>&nbsp;&nbsp;원</td>
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
							<li class="page-item"><a class="page-link" href="<%=ctx%>/adminRoomTypeList?pageNum=${pvo.pageNum-1}<c:if test="${pvo.searchKey!=null && pvo.searchWord!=null }">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">&nbsp;이전&nbsp;</a></li>
						</c:if>
						<!-- 페이지 -->
						<c:forEach var="i" begin="${pvo.startPage}" end="${pvo.startPage + pvo.onePageCount -1}">
							<c:if test="${i <= pvo.totalPage }">
								<c:if test="${i==pvo.pageNum}">
									<li class="page-item active">
										<a class="page-link" href="<%=ctx %>/adminRoomTypeList?pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord!=null }">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">&nbsp;${i}&nbsp;</a>
									</li>
								</c:if>
							
								<c:if test="${i!=pvo.pageNum }">
									<li class="page-item">
										<a class="page-link" href="<%=ctx %>/adminRoomTypeList?pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord!=null }">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">&nbsp;${i}&nbsp;</a>
									</li>
								</c:if>	
							</c:if>
							
						</c:forEach>
						<!-- 현재 페이지가 마지막 일때 -->
						<c:if test="${pvo.pageNum == pvo.totalPage }">
							 <li class="page-item disabled"><a class="page-link" href="#">&nbsp;다음&nbsp;</a></li>
						</c:if>
						<c:if test="${pvo.pageNum < pvo.totalPage }">
							 <li class="page-item"><a class="page-link" href="<%=ctx%>/adminRoomTypeList?pageNum=${pvo.pageNum+1}<c:if test="${pvo.searchKey!=null && pvo.searchWord!=null }">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">&nbsp;다음&nbsp;</a></li>
						</c:if>
					</ul>
				</div><!-- 페이징 -->
				<!-- 검색 -->
				<div class="form-group row justify-content-center">
					<div class="w100" style="padding-right:10px">
						<select class="form-control form-control-sm" name="searchKey" id="searchKey">
							<option value="room_type">객실 타입</option>
							<option value="room_name">객실 이름</option>
						</select>
					</div>
					<div class="w300" style="padding-right:10px">
						<input type="text" class="form-control form-control-sm" name="searchWord" id="searchWord">
					</div>
					<div>
						<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
					</div>
				</div><!-- 검색 -->
				
			</div>
		</div>
	</div><!-- content -->
	</div><!-- admin_main_container -->
</section>