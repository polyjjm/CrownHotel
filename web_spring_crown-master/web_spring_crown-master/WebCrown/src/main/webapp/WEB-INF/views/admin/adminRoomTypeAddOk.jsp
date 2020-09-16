<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${roomTypeAddResult>0 }">
	<script>
		alert("객실타입 등록 성공");
		location.href="<%=ctx%>/adminRoomTypeAdd";
	</script>
</c:if>
<c:if test="${roomTypeAddResult<=0 }">
	<script>
		alert("객실타입 등록 실패");
		location.href="<%=ctx%>/adminRoomTypeAdd";
	</script>
</c:if>