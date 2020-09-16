<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="width:1280px;margin:0 auto">

<table class="table table-dark table-hover">
	<thead>
		<tr>
			<th>예약자 이름</th>
			<th>방번호</th>
			<th>체크인</th>
			<th>체크 아웃</th>
			<th>인원수</th>
		</tr>

	</thead>
	<tbody id="adminRoomListTbody">

	
	<tr>
		<td>${lst[0].guest_name }</td>
		<td>${lst[0].room_num }<c:if test="${lst[1] != null}">
			,${lst[1].room_num }
	</c:if> <c:if test="${lst[2] != null}">
			,${lst[2].room_num }
	</c:if></td>
		<td>${lst[0].check_in}</td>
		<td>${lst[0].check_out }</td>
		<td>${lst[0].room_people +lst[1].room_people+lst[2].room_people }</td>
		</tr>


	</tbody>

</table>
</div>