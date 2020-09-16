<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:if test="${me_result=='success'}">
	<script>
		swal( "수정완료" , " 회번정보가 수정되었습니다. " , "success" );
	</script>
</c:if>
<c:if test="${iq_result=='success'}">
	<script>
		swal( "문의완료" , " 고객님의 문의가 등록되었습니다. " , "success" );
	</script>
</c:if>

</head>

<section>

	<main class="mpMain">
					
		<div class="mpfoBack">
					
			<span>
				<a href="/crown">홈</a>&nbsp;
				/
			</span>
			
			<span>
				&nbsp;<a id="mpbNow">나의 멥버십 정보</a>&nbsp;
			</span>
					
		</div>	
		
		<div class="mpPwdTop">
		
			<div class="mpPwdMenu_title">
			
				<div class="mpPwdMenu">
					
					<div style="position:relative">
					<i class="xi-bars xi-3x" id="a2" style="position:absolute; left: 8px"></i><i class="xi-close xi-3x" id="b2" style="position:absolute;display:none; left: 5px"></i>
					</div>
					<span style="margin-top:15px; margin-left:11.5px; color:black;">menu</span>
					<div id="mpmenuList">

						<div class="mpsubMenu">
									
							<a href="/crown/myPage" class="subText">나의 멤버십 정보 </a><br/>
										
							<a href="/crown/infoPwd" class="subText">회원정보</a>
										
						</div>
									
						<div class="mpsubMenu">
									
							<a href="<%=ctx%>/rsAllSearchOk?user_id=${user_id}" class="subText">예약내용</a><br/>
										
							<a href="/crown/withDrawal" class="subText">회원탈퇴</a>								
						</div>
						
						<div class="mpsubMenu">
									
							<a href="/crown/inquiry" class="subText">문의하기</a><br/>
																		
						</div>
								
					</div>
					
				</div>
			
			
				<span id="mpTitle">나의 멥버십 정보</span><br/>
				<span id="mpTitle2"></span>
				
			
			</div>
			
		</div>	
		
		<div id="memInfo">
		
			<div class="memInfoD">
			
				<span class="memIntt">성명</span><br/>
				<span class="memInct">${user_name}</span>
				<span class="memline"></span>
				
				
			</div>
			
			<div class="memInfoD">
			
				<span class="memIntt">리워즈번호</span><br/>
				<span class="memInct">${vo.member_code}</span>
				<span class="memline"></span>
			</div>
			
			
			
			<div class="memInfoD">
			
				<span class="memIntt">크라운호텔 리워즈 등급</span><br/>
				<span class="memInct" style="color: #5D4044">CLASSIC</span>
				<span class="memline"></span>
			</div>
			
			<div class="memInfoD">
			
				<span class="memIntt">CH포인트</span><br/>
				<span class="memInct">${vo.point}</span>
			
			</div>
			
		</div>
		
		<div id="memInfoContent">
		
			<div class="memInfoContent_d">
			
				<div id="C_T">
				
					<span>2020년 이용실적</span>
				
				</div>
				
				<div id="C_R">
				
					<div class="C_R_D">
			
						<span class="memIntt">투숙횟수</span><br/>
						<span class="memInct">${result2}회</span>
						<span class="memline2"></span>
						
					</div>
					
					<div class="C_R_D">
			
						<span class="memIntt">투숙일수</span><br/>
						<span class="memInct">${result1}박</span>
						<span class="memline2"></span>
						
					</div>
					
					<div class="C_R_D">
			
						<span class="memIntt">결제금액</span><br/>
						<span class="memInct">$${result3}</span>
						
					</div>
				
				</div>
				
				<div id="mPt">
				
					<span>등급평가 및 조정은 1월 1일부터 12월 31일까지</span><br/>
					<span>(체크아웃기준) 1년간 이용한 실적기준(투숙 횟수, 투숙일 수,</span><br/>
					<span>객실 결제 금액 중 1가지 이상) 충족 시 매년 1월 첫째 주에</span><br/>
					<span>반영됩니다.</span><br/><br/>
					
					<span>적립에 제외되는 투숙 건은 이용 실적에 포함되지 않습니다.</span>
				
				
				</div>
				
				<button id="mPtB">예약내역</button>
			
			</div>
			
			<div class="memInfoContent_d">
			
				<img src="/crown/img/img-grade-m2.png" id="gradeImg">
				
				<div id="g_t">
					<span>내년 예상 등급</span><br/>
					<span>CLASSIC</span>
				</div>
				
				<div id="g_tC">
					<span>SILVER 등급까지 남은 조건</span><br/>
					<span>3회</span><br/>
					<span>7박</span><br/>
					<span>$2000.0</span>
				</div>
				
			</div>
			
		</div>
		
		<div id="bound"></div>
		
		<div id="gradeIntro">
			
			<span id="gC">리워즈 크라운 등급 기준</span>
		
			<img src="/crown/img/grade.png" style="width: 1100px; margin-top: 30px">
		
		</div>
		
	</main>
	
</section>
</body>
</html>