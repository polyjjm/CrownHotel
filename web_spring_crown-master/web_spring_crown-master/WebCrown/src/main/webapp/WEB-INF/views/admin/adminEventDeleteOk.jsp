<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${deleteResult!=null && deleteResult>0}">
	<script>
		alert("이벤트가 삭제되었습니다.");
		location.href="<%=ctx%>/adminEventList"
	</script>
</c:if>
<c:if test="${deleteResult!=null && deleteResult<=0}">
	<script>
		alert("삭제 실패 하였습니다.");
		location.href="<%=ctx%>/adminEventView?event_code=${event_code}"
	</script>
</c:if>