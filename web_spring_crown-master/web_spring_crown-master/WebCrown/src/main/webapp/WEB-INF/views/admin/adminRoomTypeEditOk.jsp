<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${updateCnt!=null && updateCnt>0}">
	<script>
		alert("객실타입이 수정되었습니다.");
		location.href="<%=ctx%>/adminRoomTypeView?room_type_code=${room_type_code}"
	</script>
</c:if>
<c:if test="${updateCnt!=null && updateCnt<=0}">
	<script>
		alert("객실타입 수정 실패 하였습니다.");
		location.href="<%=ctx%>/adminRoomTypeEdit?room_type_code=${room_type_code}"
	</script>
</c:if>