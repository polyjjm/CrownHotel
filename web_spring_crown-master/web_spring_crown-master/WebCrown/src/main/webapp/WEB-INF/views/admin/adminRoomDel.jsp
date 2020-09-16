<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${delResult!=null && delResult>0}">
	<script>
		alert("객실이 삭제되었습니다.");
		location.href="<%=ctx%>/adminRoomList"
	</script>
</c:if>
<c:if test="${delResult!=null && delResult<=0}">
	<script>
		alert("객실 삭제 실패 하였습니다.");
		location.href="<%=ctx%>/adminRoomView?room_code=${room_code}"
	</script>
</c:if>