<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${updateCnt>0}">
	<script>
		alert("이벤트 글 수정 성공");
		location.href="<%=ctx%>/adminEventView?event_code=${event_code}";
	</script>
</c:if>
<c:if test="${updateCnt<=0}">
	<script>
		alert("이벤트 글 수정 실패");
		location.href="<%=ctx%>/adminEventEdit?event_code=${event_code}";
	</script>
</c:if>