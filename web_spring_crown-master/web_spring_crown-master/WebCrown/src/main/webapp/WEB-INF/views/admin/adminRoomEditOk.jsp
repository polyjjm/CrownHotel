<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${updateCnt>0 }">
	<script>
		alert("객실 수정 성공");
		location.href="<%=ctx%>/adminRoomView?room_code=${room_code}";
	</script>
</c:if>
<c:if test="${updateCnt<=0 }">
	<script>
		alert("객실 수정 실패");
		location.href="<%=ctx%>/adminRoomEdit?room_code=${room_code}";
	</script>
</c:if>