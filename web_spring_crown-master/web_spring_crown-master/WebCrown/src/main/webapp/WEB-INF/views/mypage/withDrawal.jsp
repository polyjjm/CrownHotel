<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:if test="${result=='fail'}">
	<script>
		swal( "탈퇴 실패" , "비밀번호를 잘못 입력하셨습니다. 다시 시도해주세요." , "error" );
	</script>
</c:if>
<script>
$(function(){
	//정규식 표현
	var txt = "Javascript and html and css";
	var reg = /jsp/i;
	var result = reg.test(txt);
	
	$("#withDrawal").submit(function(){
		if($("#user_pwd2").val()==""){
			swal( "공백 오류" , " 비밀번호를 입력하세요. " , "error" );
			return false;
		}
		
		if($("#wd_content").val()=="" ){
			swal( "공백 오류" , " 탈퇴 내용을 입력하세요. " , "error" );
			return false;
		}

	});
	
	$('#a3').on('click', function(){
		$("#a3").css("display", "none")
		$("#b3").css("display", "block")
		$("#wdmenuList").toggle('slow');
	});	
	$('#b3').on('click', function(){
		$("#a3").css("display", "block")
		$("#b3").css("display", "none")
		$("#wdmenuList").toggle('slow');
	});	
});
</script>
</head>


<section>

	<main class="wdMain">
					
		<div class="wdfoBack">
					
			<span>
				<a href="/crown">홈</a>&nbsp;
				/
			</span>
			
			<span>
				<a href="/crown/myPage">맴버</a>&nbsp;
				/
			</span>
			
			<span>
				&nbsp;<a id="wdbNow">회원탈퇴</a>&nbsp;
			</span>
					
		</div>	
		
		<div class="wdPwdTop">
		
			<div class="wdPwdMenu_title">
			
				<div class="wdPwdMenu">
					
					<div style="position:relative">
					<i class="xi-bars xi-3x" id="a3" style="position:absolute; left: 8px"></i><i class="xi-close xi-3x" id="b3" style="position:absolute;display:none; left: 5px"></i>
					</div>
					<span style="margin-top:15px; margin-left:11.5px; color:black;" id="wdMenu">menu</span>
					<div id="wdmenuList">

						<div class="wdsubMenu">
									
							<a href="/crown/myPage" class="subText">나의 멤버십 정보 </a><br/>
										
							<a href="/crown/infoPwd" class="subText">회원정보</a>
										
						</div>
									
						<div class="wdsubMenu">
									
							<a href="<%=ctx%>/rsAllSearchOk?user_id=${user_id}" class="subText">예약내용</a><br/>
										
							<a href="/crown/withDrawal" class="subText">회원탈퇴</a>													
						</div>
						
						<div class="wdsubMenu">
									
							<a href="/crown/inquiry" class="subText">문의하기</a><br/>
																		
						</div>
								
					</div>
					
				</div>
			
			
				<span id="wdTitle">회원탈퇴</span><br/>
				<span id="wdTitle2">크라운호텔 리워즈 회원을 탈퇴하시겠습니까?</span>
				<span class="wdTitle3">회원 탈퇴를 신청하시면 크라운호텔 리워즈 회원 자격이 상실됩니다.</span>
				<span class="wdTitle3">고객님의 회원정보가 삭제되면 보유하고 계신 포인트도 함께 소멸됩니다.</span>
				<span class="wdTitle3">해당 아이디는 즉시 탈퇴가 처리되며 영구적으로 사용이 중지되므로 해당 아이디로 재가입이 불가능합니다.</span>
			
			</div>
			
		</div>	
		
		<div class="wdPwd">
			
				<form method="post" action="/crown/withDrawalOk" id="withDrawal">
				
					
					<div id="wdPC">
					
						<div id="wdPC_d">
							
							<span>리워즈 번호</span><br/>
							<input type="text" readonly="readonly" value="${vo.member_code}" class="wdPC_dt" style="width: 794px">
							
							<span>현재 보유 CH포인트</span><br/>
							<input type="text" readonly="readonly" value="${vo.point}" class="wdPC_dt" style="width: 794px">
							
							<span>비밀번호</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<input type="password" placeholder="비밀번호를 입력하세요" class="mePC_dt2" style="width: 794px;" name="user_pwd2" id="user_pwd2">
							
							<span>탈퇴 사유</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<select class="wdPC_dt2" style="width: 794px;" name="wd_type">
								<option>탈퇴 사유를 입력하세요</option>
								<option>시스템 이용불편</option>
								<option>시설 불만</option>
								<option>서비스 불만</option>
								<option>이용빈도 저조</option>
								<option>개인정보의 노출우려</option>
							</select>
							
							<span>크라운호텔에게 바라는 점</span><br/>
							<textarea class="wdPC_dt3" style="width: 794px; height: 170px; resize: none;" name="wd_content" id="wd_content"></textarea>
						
						</div>

					</div>
					
					<div id="butWrap">
						
						
						<input type="submit" value="확인" id="wdfoConfirm"><input type="button" value="취소" id="mefoCancel" onClick="history.back();">
					
					</div>
					
				</form>
		</div>
		
	</main>
	
</section>
</body>
</html>