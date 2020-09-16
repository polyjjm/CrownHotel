<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section>

<div style="width:100%;height:600px">
<div style="width:1280px;margin:0 auto;text-align: center;border: 1px solid;margin-top:200px">
<h1>예약이 완료되었습니다.</h1>
<h2>고객님의 예약번호는 ${uid } 입니다 </h2>
<h3>예약조회시 반드시 예약번호가 필요합니다</h3><br/>
<input type="button" value="홈으로" onclick="location.href='/crown'" style="display: inline-block; padding: 5px 20px; min-width: 100px;background-color: #3E2B2C;
 color: #fff;border: none;text-align: center;border-radius: 5px; font-size: 16px;"/>
<input type="button" value="예약조회" onclick="location.href='<%=ctx%>/rsvCodeChk'" style="display: inline-block; padding: 5px 20px; min-width: 100px;background-color: #3E2B2C;
 color: #fff;border: none;text-align: center;border-radius: 5px; font-size: 16px;"/>
</div>

</div>


</section>