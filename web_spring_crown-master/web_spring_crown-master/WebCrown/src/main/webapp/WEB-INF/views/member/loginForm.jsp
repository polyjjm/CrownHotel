<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>
//아이디 저장
$(function(){
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("input[name='user_id']").val(userInputId); 
     
    if($("input[name='user_id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
       // 아이디 저장하기 체크되어있을 시,
        $("#loginFormCheckBox").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#loginFormCheckBox").change(function(){ // 체크박스에 변화가 발생시
        if($("#loginFormCheckBox").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='user_id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='user_id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#loginFormCheckBox").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='user_id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
   });
   
   function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
   }
   
   function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
   }
   
   function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}



$(function(){
	$("#loginFormFr").submit(function(){
		
		 if($("#loginFormInputId").val()==""){
			 alert("아이디를 입력하세요");
			 return false;
		 }
		 if($("#loginFormInputPwd").val()==""){
			 alert("비밀번호를 입력하세요");
			 return false;
		 }
	});
});

</script>
</head>
<body>
<section>
<div>
	<!-- 맨위 상단 홈 ,약관동의  -->
	<div id="loginFormBar">
	 	<span class="loginForm_home">홈</span> / <span class="loginForm_home">Step01.로그인</span>
	</div>
	<!-- 메인 -->
	<div id="loginFormCenter">
		<div>
			<span id="loginFormText">로그인</span>
			<div>
			<ul id="loginFormList">
				<li><div id="loginFormStep1"><p class="loginForm_step">Step1</p></div></li>
				<li><div id="loginFormStep2"><p class="loginForm_step">Step2</p></div></li>
				<li><div id="loginFormStep3"><p class="loginForm_step">Step3</p></div></li>
			</ul>
			</div>
		</div>
		
		<div id=loginFormBorder>
			<div id="loginFormLogin">로그인</div>
				
			  <form method="post" id="loginFormFr" action="<%=ctx%>/loginOk">
				<div id="loginFormId">아이디</div>
				<input type="text" placeholder="아이디 입력" name="user_id" id="loginFormInputId">
			
				<div id="loginFormPwd">비밀번호</div>
				<input type="password" placeholder="비밀번호 입력"  name="user_pwd" id="loginFormInputPwd">
				
				<div id="loginFormIdSave"><input type="checkbox" id="loginFormCheckBox" /> <label>아이디 저장</label></div>
				<!-- 버튼 -->
				
				<div><input type="submit" value="로그인" id="loginFormLoginOk"/></div>
				<div><a href="<%=ctx%>/findId"><input type="button" value="아이디 찾기" id="loginFormIdSearch"/></a></div>
				<div><a href="<%=ctx%>/findPwd"><input type="button" value="비밀번호 찾기" id="loginFormPwdSearch"/></a></div>
				</form>
		
		</div><!-- loginFormBorder -->



	</div><!-- 메인 -->
</div>
</section>
</body>
</html>