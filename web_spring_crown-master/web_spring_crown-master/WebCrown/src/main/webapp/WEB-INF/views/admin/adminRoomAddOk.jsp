<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${roomAddResult>0 }">
	<script>
		alert("객실 등록 성공");
		location.href="<%=ctx%>/adminRoomAdd";
	</script>
</c:if>
<c:if test="${roomAddResult<=0 }">
	<script>
		alert("객실 등록 실패");
		location.href="<%=ctx%>/adminRoomAdd";
	</script>
</c:if>