<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="<%=ctx%>/css/jquery-ui.min.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<%=ctx%>/js/jquery-ui.min.js"></script>
<script>
$(function(){
	$("#searchRs").submit(function(){

		if($("#S1").val()=="" || $("#S2").val()==""){
			swal( "공백 오류" , " 날짜를 선택하세요. " , "error" );
			return false;
		}
		
	});
});
</script>
<section>

	<main class="rvMain">

		<div class="rvfoBack">

			<span> <a href="/crown">홈</a>&nbsp; /
			</span> <span> <a href="/crown/myPage">맴버</a>&nbsp; /
			</span> <span> &nbsp;<a id="rvbNow">회원탈퇴</a>&nbsp;
			</span>

		</div>

		<div class="rvPwdTop">

			<div class="rvPwdMenu_title">

				<div class="rvPwdMenu">

					<div style="position: relative">
						<i class="xi-bars xi-3x" id="a3"
							style="position: absolute; left: 8px"></i><i
							class="xi-close xi-3x" id="b3"
							style="position: absolute; display: none; left: 5px"></i>
					</div>
					<span style="margin-top: 15px; margin-left: 11.5px; color: black;"
						id="rvMenu">menu</span>

					<div id="rvmenuList">

						<div class="rvsubMenu">

							<a href="/crown/myPage" class="subText">나의 멤버십 정보 </a><br /> 
							<a href="/crown/infoPwd" class="subText">회원정보</a>

						</div>

						<div class="rvsubMenu">

								<a href="<%=ctx%>/rsAllSearchOk?user_id=${user_id}" class="subText">예약내용</a><br /> 
								<a href="/crown/withDrawal" class="subText">회원탈퇴</a>
						</div>

						<div class="rvsubMenu">

							<a href="/crown/inquiry" class="subText">문의하기</a><br />

						</div>

					</div>

				</div>

				<span id="rvTitle">객실/패키지 예약내역</span><br /> <span class="rvTitle3"
					id="rvTitle3">객실/패키지 예약 내역을 확인하실 수 있습니다.</span> <span
					class="rvTitle3">크라운호텔 리워즈 회원으로 온라인 예약하신 건에 한하여 조회가 가능합니다.</span> <span
					class="rvTitle3">과거 또는 미래의 예약내역을 조회하시려면 하단의 체크인 및 체크아웃 날짜를
					변경해주십시오.
				</span>

			</div>

		</div>

		<!-- 객실/패키지 예약 -->
		<div id="reservation">
		
			<span id="resspan1">투숙기간</span>&nbsp;&nbsp;
			
			<form method="post" action="<%=ctx%>/rsAllSearchOk" id="searchRs">
				
			`<div id="rd">
				
			 <input type="radio" value="check_in" name="searchKey" id="r1" checked>체크인<br/>
			 <input type="radio" value="check_out" name="searchKey" id="r2">체크아웃
			 
			 </div>
			 
			 <div id="rd2">
			 
			 <input type="text" readonly="readonly" class="cal1" name="startDate" id="S1"/> 
				~ 
			 <input type="text" readonly="readonly" class="cal1" name="endDate" id="S2"/>
			
			 <input type="submit" value="예약조회" id="rssubmit">
			 
			
			 
			  </div>
			 
			<div id="datepickerdiv"></div>
			
			</form>
			
			 <button id="allRsv">
				<a href="<%=ctx%>/rsAllSearchOk" class="subText" style="color: #fff" id="allRsvA">모든예약보기</a>
			 </button>

		</div>
		<div id="rs_tb_wrap">
			<table class="table">
				<thead class="thead-light">
					<tr class="admin_board_list_title">
						<th>번호</th>
						<th>결제번호</th>
						<th>객실종류</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>결제여부</th>
				</thead>
				<tbody>
					
					<c:forEach var="vo" items="${lst}">
						<tr class="admin_board_list_line">
							<td>${vo.rownum}</td>
							<td>${vo.payment_order_number}</td>
							<td>${vo.room_name}</td>
							<td>${vo.check_in}</td>
							<td>${vo.check_out}</td>
							<td>${vo.status}</td>
						</tr>	
					</c:forEach>
				</tbody>	
				
			</table>
				<c:if test="${empty lst}">
					<div style="text-align:center;">예약내역이 존재하지 않습니다.</div>
				</c:if>	
			
			<div id="pagingbtn">
						<!-- 페이징 -->
						<!-- 현재페이지가 1페이지 일떄 -->
						<ul class="pagination">
							<!-- 현재 페이지가 1페이지 일때 -->
							<c:if test="${pvo.pageNum==1}">
								<li class="page-item disabled"><a class="page-link"
									href="#">prev</a></li>
							</c:if>
							<!-- 현재 페이지가 1페이지가 아닐 떄 -->
							<c:if test="${pvo.pageNum!=1}">
								<li class="page-item"><a class="page-link"
									href="<%=ctx %>/rsAllSearchOk?user_id=${pvo.user_id}&pageNum=${pvo.pageNum-1}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">prev</a></li>
							</c:if>
							<c:forEach var="i" begin="${pvo.startPage}"
								end="${pvo.startPage + pvo.onePageCount-1 }">
								<c:if test="${i<=pvo.totalPage}">
									<c:if test="${i==pvo.pageNum }">
										<li class="page-item active"><a class="page-link"
											href="<%=ctx %>/rsAllSearchOk?user_id=${pvo.user_id}&pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">${i}</a>
										</li>
									</c:if>
									<c:if test="${i!=pvo.pageNum }">
										<li class="page-item"><a class="page-link"
											href="<%=ctx %>/rsAllSearchOk?user_id=${pvo.user_id}&pageNum=${i}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">${i}</a>
										</li>
									</c:if>
								</c:if>
							</c:forEach>
							<c:if test="${pvo.pageNum == pvo.totalPage}">
								<li class="page-item disabled"><a style="color: black"
									class="page-link" href="#">next</a></li>
							</c:if>
							<c:if test="${pvo.pageNum < pvo.totalPage}">
								<li class="page-item"><a class="page-link"
									href="<%=ctx %>/rsAllSearchOk?user_id=${pvo.user_id}&pageNum=${pvo.pageNum+1}<c:if test="${pvo.searchKey!=null && pvo.searchWord !=null}">&searchKey=${pvo.searchKey}&searchWord=${pvo.searchWord}</c:if>">next</a></li>
							</c:if>
						</ul>
					</div>
					<!-- 페이징 -->
		</div>
	</main>

</section>
