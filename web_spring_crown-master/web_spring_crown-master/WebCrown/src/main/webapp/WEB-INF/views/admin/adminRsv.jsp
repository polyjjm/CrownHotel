<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=ctx %>/css/admin.css" type="text/css"/>
<script>

$(function (){
	


		

	$("#userCheckIn").datepicker({
	    showOn: "both",

	    buttonImage: "img/ca.jpg",

	    buttonImageOnly: true,

	    buttonText: "Select date",
		dateFormat: "yy-mm-dd"
		
	});
	$("#userCheckOut").datepicker({
		
	    showOn: "both",

	    buttonImage: "img/ca.jpg",

	    buttonImageOnly: true,

	    buttonText: "Select date",
	    dateFormat: "yy-mm-dd"
		
	});

	
	
	
	$(".paymentCode").on('click',function(){
		var  paymentCode= $(this).html();
		location.href= "adminRsvInfo?paymentCode="+paymentCode;
	});

	
});

</script>

	<div class="admin_content_wrap">
		
		<div class="admin_content_top">
			<div class="admin_content_title">
				<h2>예약자 조회</h2>
			</div>
		</div>
		
		<div class="admin_content_box">
			<div class="admin_content_form">
			<h4>조회하실 기간을 입력해주세요</h4>
			<div class="userCheckInOut">
				<form method="get" action="allUserRsvList" autocomplete="off">
				 <input type="text" name="check_in" id="userCheckIn" size="12" /> ~ <input type="text" name="check_out" id="userCheckOut" size="12" /><br/>
				 <input type="text" name="searchWord"/><select name="searchKey"><option>모두선택</option><option>회원</option><option>비회원</option></select><br/>
				 <input type="submit" value="조회"/>
				</form>
			</div>
			
			<div>
			
			<div class="adminRsvUserList">


						<table class="table table-dark table-hover" id="adminRoomListTable">

							<thead>
								<tr>
									<th>결제일</th>
									<th>이름</th>
									<th>결제 번호</th>
									<th>결제 코드</th>
									<th>결제금액</th>
									<th>결제상태</th>
								</tr>
							</thead>
							<tbody id="adminRoomListTbody">
							
							
						
							<c:if test="${empty lst}"   >
							
							<div style="text-align: center;position: absolute;top:50%;left:37%"><h1>조회된 결과가 없습니다</h1></div>
								</c:if>							
						
								<c:forEach var="vo" items="${lst }">
							
								
							<tr onclick="location.href='<%=ctx%>/adminRsvInfo?paymentCode=${vo.payment_code}'">	
							
							<c:if test="${fn:length(lst) !=0}"   >
										
										<td>${vo.pay_date}</td>
										<td>${vo.name }&nbsp;<span>님</span></td>
										<td >${vo.payment_code }</td>
										<td>${vo.payment_order_number }</td>
										<td><span><span><fmt:formatNumber value="${vo.payment}" pattern="#,###"/></span><span>&nbsp;&nbsp;원</span></span></td>
										<td>${vo.status }</td>
							</c:if>			
							</tr>	
								</c:forEach>
								
							</tbody>
						</table>
				
 <div>
 								<c:if test="${pvo.pageNum != 0}"   >
							<!-- 현재페이지가 1페이지 일떄 -->
							<ul class="pagination">
							<!-- 현재 페이지가 1페이지 일때 -->
								<c:if test="${pvo.pageNum==1}">
									<li class="page-item disabled"><a class="page-link" href="#">prev</a></li>
								</c:if>
								<!-- 현재 페이지가 1페이지가 아닐 떄 -->
								<c:if test="${pvo.pageNum!=1}">
									<li class="page-item"><a class="page-link" href="<%=ctx %>/allUserRsvList?pageNum=${pvo.pageNum-1}<c:if test="${pvo.check_in !=null }">&check_in=${pvo.check_in}&check_out=${pvo.check_out}&searchWord=${pvo.searchWord}&searchKey=${pvo.searchKey}</c:if>">prev</a></li>
								</c:if>
						
								<c:forEach var="i" begin="${pvo.startPage}" end="${pvo.startPage + pvo.onePageCount-1 }">
									<c:if test="${i<=pvo.totalPage}"> 
										<c:if test="${i==pvo.pageNum }">
											<li class="page-item active">
												<a class="page-link" href="<%=ctx %>/allUserRsvList?pageNum=${i}<c:if test="${pvo.check_in !=null }">&check_in=${pvo.check_in}&check_out=${pvo.check_out}&searchWord=${pvo.searchWord}&searchKey=${pvo.searchKey}</c:if>"> ${i}</a>
											</li>
										</c:if>
										<c:if test="${i!=pvo.pageNum }">
											<li class="page-item">
												<a class="page-link" href="<%=ctx %>/allUserRsvList?pageNum=${i}<c:if test="${pvo.check_in !=null }">&check_in=${pvo.check_in}&check_out=${pvo.check_out}&searchWord=${pvo.searchWord}&searchKey=${pvo.searchKey}</c:if>">${i}</a>
											</li>
										</c:if>
									</c:if>		
								</c:forEach>
								<c:if test="${pvo.pageNum == pvo.totalPage}">
									  <li class="page-item disabled"><a style="color:black" class="page-link" href="#">next</a></li>
								</c:if>	 
								<c:if test="${pvo.pageNum < pvo.totalPage}"> 
									   <li  class="page-item"><a class="page-link" href="<%=ctx %>/allUserRsvList?pageNum=${pvo.pageNum+1}&check_in=${pvo.check_in}<c:if test="${pvo.check_in !=null }">&check_in=${pvo.check_in}&check_out=${pvo.check_out}&searchWord=${pvo.searchWord}&searchKey=${pvo.searchKey}</c:if>">next</a></li>
								</c:if>
							</ul>
							</c:if>
						</div><!-- 페이징 -->
				

					</div>


</div>






			</div>
		</div>
	
	</div>
	</div>
</section>






 




