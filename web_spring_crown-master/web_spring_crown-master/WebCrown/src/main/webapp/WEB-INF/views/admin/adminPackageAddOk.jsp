<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${packAddResult>0 }">
	<script>
		alert("패키지 등록 성공");
		location.href="<%=ctx%>/adminPackageAdd";
	</script>
</c:if>
<c:if test="${packAddResult<=0 }">
	<script>
		alert("패키지 등록 실패");
		location.href="<%=ctx%>/adminPackageAdd";
	</script>
</c:if>
<c:if test="${packNumAddResult<=0 }">
	<script>
		alert("패키지 개수를 확인해주세요.");
		location.href="<%=ctx%>/adminPackageAdd";
	</script>
</c:if>