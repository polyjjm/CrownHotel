<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=ctx %>/css/eventView.css" type="text/css" />
<script>
	document.title="호텔 이벤트 상세보기 | 크라운 호텔";
</script>
<section>
<div id="mainDiv">
	<div id="title">
		<div id="route">홈&nbsp;&nbsp;/&nbsp;&nbsp;프로모션&nbsp;&nbsp;/&nbsp;&nbsp;호텔 이벤트&nbsp;&nbsp;/&nbsp;&nbsp;${aevo.event_name}</div>
	</div>
	<div id="content">
		<div id="contentTitle">
			<h1>${aevo.event_name}</h1><br/>
		</div>
		<div id="content">
			<div id="eventContent">
				<img src="upload/${aevo.img}"/>
				<div id="eventInfo">
					<p>${aevo.event_mdsp}</p>
					<div id="eventInfoDetail">
						기간 ${aevo.event_start}~${aevo.event_end}
					</div>
				</div>
			</div>
			<div id="eventType">
				<div id="leftDetail">이벤트 상세정보</div>
				<div id="eventDiv">
					<ul class="eventContent">
						<li class="eContent">
							<div id="eDetail">${aevo.event_sdsp}</div>
						</li>
					</ul>
				</div>
			<div style="clear:both; height:30px"></div>
			</div>
		</div>
	</div>
</div>
<div id="packageList">
	<a href="/crown/hotelEvent">
		<button>목록</button>
	</a>
</div>
</section>
</body>
</html>