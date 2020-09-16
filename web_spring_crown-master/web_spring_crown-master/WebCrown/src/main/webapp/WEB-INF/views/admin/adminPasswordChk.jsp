<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${pwdResult!=null && separator!=null && room_separator!=null && pwdResult>0 && separator=='E' && room_separator=='T'}">
	<script>	
		opener.location.href = "<%=ctx%>/adminRoomTypeEdit?room_type_code=${room_type_code}";
		window.close();
	</script>
</c:if>
<c:if test="${pwdResult!=null && separator!=null && room_separator!=null && pwdResult>0 && separator=='D' && room_separator=='T'}">
	<script>	
		opener.location.href = "<%=ctx%>/adminRoomTypeDel?room_type_code=${room_type_code}";
		window.close();
	</script>
</c:if>
<c:if test="${pwdResult!=null && separator!=null && room_separator!=null && pwdResult>0 && separator=='E' && room_separator=='R'}">
	<script>	
		opener.location.href = "<%=ctx%>/adminRoomEdit?room_code=${room_code}";
		window.close();
	</script>
</c:if>
<c:if test="${pwdResult!=null && separator!=null && room_separator!=null && pwdResult>0 && separator=='D' && room_separator=='R'}">
	<script>	
		console.log("삭제 이동 ");
		opener.location.href = "<%=ctx%>/adminRoomDel?room_code=${room_code}";
		window.close();
	</script>
</c:if>


<link rel="stylesheet" href="<%=ctx %>/css/admin.css" type="text/css" />
<style>
	header, footer{display:none}
	.admin_menu_wrap{display:none}
	#chkWindow{width:100%;text-align:center;padding:50px 0;}
	#chkWindow>form>div{padding:30px 5px; }
	#btn{border:none}
	#alertDanger{width:80%;padding:10px 50px;background-color:#FFCCDA;
	border-radius:5px;margin:20px auto;color:#666}
</style>
<script>
$(function(){
	$(document).on('keyup','#password',function(e){
		if(e.keyCode == 13){
			adminCheckOk();
		}
	});
});
	
function adminPasswordChk(){
	console.log("삭제창");
	if(document.chkFrm.password.value == ""){
		alert("비밀번호를 입력하세요.");
		document.chkFrm.password.focus();
		
		return false;
	}
	document.chkFrm.submit();
}
</script>
</head>
<body>
<div id="chkWindow">
	<h4>비밀번호 확인</h4>
	<form method="post" id="chkFrm" name="chkFrm" action="<%=ctx %>/adminPasswordChkOk">
		<input type="hidden" name="room_type_code" value="${room_type_code}"/>
		<input type="hidden" name="room_code" value="${room_code}"/>
		<input type="hidden" name="room_separator" value="${room_separator}"/>
		<input type="hidden" name="separator" value="${separator}"/>
		<div>비밀번호 : <input type="password" name="password" id="password" autofocus="autofocus"></div>
		<input id="btn" type="button" onclick="adminPasswordChk();" value="확인" class="admin_btn"/>
		<a class="admin_btn" href="javascript:self.close();">취소</a>
	</form>
	<c:if test="${pwdResult!=null && pwdResult==0}">
		<div>
			<div id="alertDanger">비밀번호가 일치하지 않습니다.</div>
		</div>
	</c:if>
	
</div>
