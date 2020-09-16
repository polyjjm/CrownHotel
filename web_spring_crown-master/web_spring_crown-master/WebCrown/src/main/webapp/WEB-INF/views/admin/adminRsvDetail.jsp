<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=ctx %>/css/admin.css" type="text/css"/>

<div class="admin_content_wrap">
		<div class="admin_content_top">
			<div class="admin_content_title">
				<h2>예약 상세페이지</h2>

			</div>
		</div>
<div class="admin_content_box">
<div>
<div>결제 번호 : ${lst[0].payment_code }<br/></div>
<div>이름 : ${lst[0].name }<br/></div>
<div>총결제금액: ${lst[0].payment } 원 <br/></div>
<div>방번호 : ${lst[0].room_num }호

,${lst[1].room_num }호


,${lst[2].room_num }호

</div>
<div>숙박일 :${lst[0].check_in  }  ~   ${lst[0].check_out }<br/></div>

<div style="width:1000px;">조식인원 :${lst[0].room_num }호 : ${lst[0].breakfast_adult }명
<c:if test="${lst[1].room_num != null }">
,${lst[1].room_num }호 : ${lst[1].breakfast_adult }명 
</c:if>
<c:if test="${lst[2].room_num != null }">
,${lst[2].room_num }호 : ${lst[2].breakfast_adult }명 
</c:if>
</div>
	<div style="width:1100px;height:300px">
<h3>요청사항</h3><br/>
		
		<div style="width:1100px; float:left"><div style="width:350px; float:left">객실1</div><div style="width:350px; float:left">객실2</div><div style="width:350px; float:left">객실3</div></div><br/>
		<div style="width:1100px">
		 <div style="width:350px;float:left"><input type="text" value="<c:if test="${lst[0].require ==null }"> 요청사항이없습니다.</c:if> <c:if test="${lst[0].require !=null }">${lst[0].require} </c:if>" style="width:300px;height:200px;float:left" readonly="readonly"/></div>
 		 <div style="width:350px;float:left"><input type="text" value="<c:if test="${lst[1].require ==null }"> 요청사항이없습니다.</c:if> <c:if test="${lst[1].require !=null }">${lst[1].require} </c:if>"style="width:300px;height:200px;float:left" readonly="readonly"/></div>
   	 	 <div style="width:350px;float:left"><input type="text" value="<c:if test="${lst[1].require ==null }"> 요청사항이없습니다.</c:if> <c:if test="${lst[1].require !=null }">${lst[1].require} </c:if>"style="width:300px;height:200px;float:left" readonly="readonly"/></div>
		</div>
	</div>



<div><input type="button" value="뒤로가기" onclick="history.back();" style="display: inline-block; padding: 5px 20px; min-width: 100px;background-color: #3E2B2C;
 color: #fff;border: none;text-align: center;border-radius: 5px; font-size: 16px;"/></div>

</div>
</div>




</div>
</section>