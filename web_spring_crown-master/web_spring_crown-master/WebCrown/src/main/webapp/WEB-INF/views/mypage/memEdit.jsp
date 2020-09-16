<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:if test="${me_result=='fail'}">
	<script>
		swal( "수정실패" , " 회번정보 수정에 실패하였습니다. " , "error" );
	</script>
</c:if>
<script>
$(function(){
	//정규식 표현
	var txt = "Javascript and html and css";
	var reg = /jsp/i;
	var result = reg.test(txt);
	
	$("#memEditFrm").submit(function(){
		
		if($("#user_name").val()=="" ){
			swal( "공백 오류" , " 성명(한글)을 입력하세요. " , "error" );
			return false;
		}
		//성명 한글
		reg = /^[가-힣]{2,7}$/;
		if(!reg.test(document.getElementById("user_name").value)){
			swal( "입력 오류" , "성명(한글)은 2~7글자 까지 허용합니다." , "error" );
			return false;
		}
		
		if($("#user_email").val()==""){
			swal( "공백 오류" , " 이메일을 입력하세요. " , "error" );
			return false;
		}
		
		reg = /^\w{8,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if(!reg.test(document.getElementById("user_email").value)){
			swal( "입력 오류" , "이메일을 잘못입력하였습니다." , "error" );
			return false;
		}	

		if($("#tel_number").val()==""){
			swal( "공백 오류" , " 연락처를 입력하세요. " , "error" );
			return false;
		}
		
		//연락처
		reg = /^\d{3}\d{3,4}\d{4}$/;
		if(!reg.test(document.getElementById("tel_number").value)){
			swal( "입력 오류" , "연락처는 숫자만 10~11자리까지 허용합니다." , "error" );
			return false;
		}
		
	});
});
</script>
</head>

<section>

	<main class="meMain">
					
		<div class="mefoBack">
					
			<span>
				<a href="/crown">홈</a>&nbsp;
				/
			</span>
			
			<span>
				<a href="/crown/myPage">맴버</a>&nbsp;
				/
			</span>
			
			<span>
				&nbsp;<a href="/crown/infoPwd">회원정보</a>&nbsp;
				/
			</span>
			
			<span>
				&nbsp;<a id="ifbNow">회원정보 수정</a>&nbsp;
			</span>
					
		</div>	
		
		<div class="mePwdTop">
		
			<div class="mePwdMenu_title">
			
				<div class="mePwdMenu">
					
					<div style="position:relative">
					<i class="xi-bars xi-3x" id="a3" style="position:absolute; left: 8px"></i><i class="xi-close xi-3x" id="b3" style="position:absolute;display:none; left: 5px"></i>
					</div>
					<span style="margin-top:15px; margin-left:11.5px; color:black;">menu</span>
					<div id="memenuList">

						<div class="mesubMenu">
									
							<a href="/crown/myPage" class="subText">나의 멤버십 정보 </a><br/>
										
							<a href="/crown/infoPwd" class="subText">회원정보</a>
										
						</div>
									
						<div class="mesubMenu">
									
							<a href="<%=ctx%>/rsAllSearchOk?user_id=${user_id}" class="subText">예약내용</a><br/>
										
							<a href="/crown/withDrawal" class="subText">회원탈퇴</a>													
						</div>
						
						<div class="mesubMenu">
									
							<a href="/crown/inquiry" class="subText">문의하기</a><br/>
																		
						</div>
								
					</div>
					
				</div>
			
			
				<span id="meTitle">회원정보 수정</span><br/>
				<span id="meTitle2"></span>
			
			</div>
			
		</div>	
		
		<div class="mePwd">
			
				<form method="post" action="<%=ctx%>/memEditOk" id="memEditFrm">
				
					<input type="hidden" name="member_code" value="${vo.member_code}"/>
						<span>개인 정보 입력</span>
					
					<div id="mePC">
					
						<div id="mePC_d">
						
							<span>성명(영문)</span><br/>
							<input type="text" readonly="readonly" value="${vo.name_last}" class="mePC_dt">
							<input type="text" readonly="readonly" value="${vo.name_first}" class="mePC_dt"><br/>
						
							<span>생년월일</span><br/>
							<input type="text" readonly="readonly" value="${vo.year}-${vo.month}-${vo.day}" class="mePC_dt" style="width: 794px">
							
							<span>아이디</span><br/>
							<input type="text" readonly="readonly" value="${vo.user_id}" class="mePC_dt" style="width: 794px">
							
							<span>비밀번호</span><br/>
							<a href="/crown/changePwd"><input type="button" value="비밀번호 변경" id="mePC_db"></a><br/>
							
							<span>성명(한글)</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<input type="text" value="${vo.user_name}" class="mePC_dt2" style="width: 794px;" name="user_name" id="user_name">
							
							<span>이메일</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<input type="text" value="${vo.user_email}" class="mePC_dt2" style="width: 794px;" name="user_email" id="user_email">
						
						</div>
						
						<span id="meTitle2"></span>
					
					</div>
					
					<div id="mePC2">
					
						<span>연락처 정보 입력</span>
						
						<div id="mePC_d2">
						
							<span>연락처</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<select id="mePC_d2C" name="tel_menu">
						
								<option value="모바일" style="background-color: F5F5F5">모바일</option>
	   							<option value="자택" style="background-color: F5F5F5">자택</option>
						
							</select>
							
							<select id="mePC_d2C" name="tel_from" style="display: none;">
						
								<option value="${vo.tel_from}">${vo.tel_from}</option>
						
							</select>
							
							<input type="text" value="${vo.tel_number}" class="mePC_dt2" style="width: 638px;" name="tel_number" id="tel_number">
						
						</div>
						
					</div>
					
				
					<div id="butWrap">
						
						
						<input type="submit" value="확인" id="mefoConfirm"><input type="button" value="취소" id="mefoCancel" onClick="history.back();">
					
					</div>
					
				</form>
		</div>
		
	</main>
	
</section>
</body>
</html>