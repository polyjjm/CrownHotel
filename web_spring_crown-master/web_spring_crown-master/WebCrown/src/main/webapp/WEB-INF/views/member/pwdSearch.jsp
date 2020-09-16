<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${vo.user_pwd != null && vo.user_pwd != ''}">
   <script>
      var user_pwd = '${vo.user_pwd}';
      alert("조회하신 비밀번호는  "+user_pwd+" 입니다.");
      location.href="<%=ctx%>/loginForm";
   </script>
</c:if>

<c:if test="${vo.user_pwd ==null || vo.user_pwd == '' }">
   <script>
      alert("비밀번호가 조회되지 않습니다. 다시 확인 후 조회부탁드립니다.");
      history.go(-1);
   </script>
</c:if>
