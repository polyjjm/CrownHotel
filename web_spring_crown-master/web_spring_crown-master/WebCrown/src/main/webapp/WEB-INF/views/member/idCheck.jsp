<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style>
	header,footer{display:none}
	
	
</style>
<script>
	$(function(){
		$("#idSet").click(function(){
			opener.document.getElementById("user_id").value=$("#idSearch").text();
			opener.document.getElementById("idStatus").value="Y";
			self.close();
		});
	});
</script>
</head>
<body>
<div class="idCheck_container" id="idCheckContainer">

<span id="idSearch">${user_id}는</span>
<c:if test="${idresult==0 }">
<script>
	alert("사용가능한 아이디입니다.");
	document.getElementById("user_id").value =${user_id};
</script>
 
<input type="button" value="아이디 사용하기" id="idSet" onClick='window.close()'/>
 </c:if>
<c:if test="${idresult==1 }">
<script>
	alert("사용불가능 아이디입니다.");
	document.getElementById("user_id").value ="";
</script>
<input type="button" value="닫기" id="idSet" onClick='window.close()'/>


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
