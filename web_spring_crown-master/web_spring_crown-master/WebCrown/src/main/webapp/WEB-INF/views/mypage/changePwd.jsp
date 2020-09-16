<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:if test="${result=='fail'}">
<script>
	swal( "입력 오류" , "현재비밀번호를 잘못 입력하였습니다." , "error" );
</script>
</c:if>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script>
$(function(){
	//정규식 표현
	var txt = "Javascript and html and css";
	var reg = /jsp/i;
	var result = reg.test(txt);
	
	$("#changePwd").submit(function(){
		
		if($("#user_pwd2").val()=="" ){
			swal( "공백 오류" , " 현재 비밀번호를 입력하세요. " , "error" );
			return false;
		}
		//비밀번호
		reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
		if(!reg.test(document.getElementById("user_pwd").value)){
			swal( "입력 오류" , "비밀번호는 영문, 숫자 포함 8~20자리 까지만 허용합니다." , "error" );
			return false;
		}
		
		if($("#user_pwd").val()==$("#user_pwd2").val()){
			swal( "입력 오류" , "현재 비밀번호와 일치합니다. " , "error" );
			return false;
		}
		
		
		if($("#user_pwd").val()==""){
			swal( "공백 오류" , " 새로운 비밀번호를 입력하세요. " , "error" );
			return false;
		}
		
		if($("#user_pwd3").val()=="" ){
			swal( "공백 오류" , "비밀번호를 재입력을 해주세요. " , "error" );
			return false;
		}

		if($("#user_pwd3").val()!=$("#user_pwd").val()){
			swal( "입력 오류" , "비밀번호 재입력을 확인하세요. " , "error" );
			return false;
		}
		
	});
});
</script>
</head>


<section>

	<main class="cpMain">
					
		<div class="cpfoBack">
					
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
				&nbsp;<a id="cpbNow">비밀번호 변경</a>&nbsp;
			</span>
					
		</div>	
		
		<div class="cpPwdTop">
		
			<div class="cpPwdMenu_title">
			
				<div class="cpPwdMenu">
					
					<div style="position:relative">
					<i class="xi-bars xi-3x" id="a4" style="position:absolute; left: 8px"></i><i class="xi-close xi-3x" id="b4" style="position:absolute;display:none; left: 5px"></i>
					</div>
					<span style="margin-top:15px; margin-left:11.5px; color:black;">menu</span>
					<div id="cpmenuList">

						<div class="cpsubMenu">
									
							<a href="/crown/myPage" class="subText">나의 멤버십 정보 </a><br/>
										
							<a href="/crown/infoPwd" class="subText">회원정보</a>
										
						</div>
									
						<div class="cpsubMenu">
									
							<a href="<%=ctx%>/rsAllSearchOk?user_id=${user_id}" class="subText">예약내용</a><br/>
										
							<a href="/crown/withDrawal" class="subText">회원탈퇴</a>														
						</div>
						
						<div class="cpsubMenu">
									
							<a href="/crown/inquiry" class="subText">문의하기</a><br/>

																		
						</div>
								
					</div>
					
				</div>
			
			
				<span id="cpTitle">비밀번호 변경</span><br/>
				
			
			</div>
			
		</div>	
		
		<div class="cpPwd">
			
				<form method="post" action="/crown/changePwdOk" id="changePwd">
				
					
					<div id="cpPC">
					
						<div id="cpPC_d">
						
							<span>현재비밀번호</span><br/>
							<input type="password" class="cpPC_dt" style="width: 794px" placeholder="현재비밀번호" name="user_pwd2" id="user_pwd2">
							
							<span>새로운 비밀번호</span><br/>
							<input type="password" class="cpPC_dt" style="width: 794px" placeholder="새로운 비밀번호" name="user_pwd" id="user_pwd">
							
							<span>비밀번호 재입력</span><br/>
							<input type="password" class="cpPC_dt" style="width: 794px" placeholder="비밀번호 재입력" id="user_pwd3">
						
							<label id="cpPC_dt2">비밀번호를 변경하면 자동으로 로그아웃 됩니다. 변경된 비밀번호로 다시 로그인해 주시기 바랍니다.</label>
						
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