<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style>
	header,footer{display:none}
</style>
<script>
	$(function(){
		$("#emailSet").click(function(){
			opener.document.getElementById("user_email_ckeck").value=$("#emailSearch").text();
			opener.document.getElementById("emailStatus").value="Y";
			self.close();
		});
	});
</script>
</head>
<body>
<div class="idCheck_container" id="idCheckContainer">

<span id="emailSearch">${user_email}</span>는
<c:if test="${emailresult==0 }">
<script>
	alert("사용가능한 이메일입니다.");
	document.getElementById("user_email_ckeck").value =${user_email};
</script>
 
<input type="button" value="아이디 사용하기" id="emailSet" onClick='window.close()'/>
 </c:if>
<c:if test="${emailresult==1 }">
<script>
	alert("사용불가능 이메일입니다.");
	document.getElementById("user_email_ckeck").value ="";
</script>
<input type="button" value="닫기" id="emailSet" onClick='window.close()'/>


<!--<h3>아이디를 입력후 중복검사버튼 누르세요.</h3>
<form method="post" action="<%=request.getContextPath()%>/idCheckOk">
<br/>
	<label>
	   아이디
	</label>
<br/>	
<input type="text" name="user_id" id="user_id" placeholder="영문, 숫자, 특수기호(_),(-) 조합  5~20자 이내"/>
<input type="submit" id="idSet" value="중복검사하기" id="idCheck"/>
						
</form>
-->
</c:if>





</div>
</body>
