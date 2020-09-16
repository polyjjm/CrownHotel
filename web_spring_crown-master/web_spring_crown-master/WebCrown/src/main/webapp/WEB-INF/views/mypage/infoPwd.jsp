<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<c:if test="${result=='fail'}">
<script>
	swal( "입력 오류" , " 비밀번호를 잘못 입력하였습니다. " , "error" );
</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script>
$(function(){

	$("#infoPwd").submit(function(){
		
		if($("#pwdTxt").val()=="" ){
			swal( "공백 오류" , " 비밀번호를 입력하세요. " , "error" );
			return false;
		}
		
	});
});
</script>
<title>비밀번호 확인</title>
</head>

<section>

	<main class="ifMain">
					
		<div class="infoBack">
					
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
				&nbsp;<a id="ifbNow">회원정보</a>&nbsp;
			</span>
					
		</div>	
		
		<div class="ifPwdTop">
		
			<div class="inPwdMenu_title">
			
				<div class="inPwdMenu">
					
					<div style="position:relative">
					<i class="xi-bars xi-3x" id="a" style="position:absolute; left: 8px"></i><i class="xi-close xi-3x" id="b" style="position:absolute;display:none; left: 5px"></i>
					</div>
					<span style="margin-top:15px; margin-left:11.5px; color:black;">menu</span>
					<div id="ifmenuList">

						<div class="ifsubMenu">
									
							<a href="/crown/myPage" class="subText">나의 멤버십 정보 </a><br/>
										
							<a href="/crown/infoPwd" class="subText">회원정보</a>
										
						</div>
									
						<div class="ifsubMenu">
									
							<a href="<%=ctx%>/rsAllSearchOk?user_id=${user_id}" class="subText">예약내용</a><br/>
										
							<a href="/crown/withDrawal" class="subText">회원탈퇴</a>													
						</div>
						
						<div class="ifsubMenu">
									
							<a href="/crown/inquiry" class="subText">문의하기</a><br/>
																		
						</div>
								
					</div>
					
				</div>
			
			
				<span id="ifTitle">회원정보</span><br/>
				<span id="ifTitle2">외부로부터 고객님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</span>
			
			</div>
			
		</div>	
		
		<div class="ifPwd">
		
			<span>비밀번호</span><br/>
			
				<form method="post" id="infoPwd" action="/crown/infoPwdOk">
				
					<input id="pwdTxt" type="password" placeholder="비밀번호를 입력하세요."  name="user_pwd"><br/>
					
					<div id="butWrap">
					
						<input type="submit" value="확인" id="infoConfirm"><input type="button" value="취소" id="infoCancel" onClick="history.back();">
					
					</div>
					
				</form>
		</div>
		
	</main>
	
</section>
</body>
</html>