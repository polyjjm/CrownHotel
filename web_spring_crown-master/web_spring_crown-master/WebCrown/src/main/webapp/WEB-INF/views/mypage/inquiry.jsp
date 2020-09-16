<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:if test="${iq_result=='fail'}">
	<script>
		swal( "문의실패" , " 문의 등록이 실패하였습니다. 다시 입력하세요." , "error" );
	</script>
</c:if>
<script>
$(function(){
	//정규식 표현
	var txt = "Javascript and html and css";
	var reg = /jsp/i;
	var result = reg.test(txt);
	
	$("#inquiry").submit(function(){
		
		// 문의 제목
		if($("#iq_title").val()=="" ){
			alert("제목을 입력하세요.");
			return false;
		}

		// 문의 내용
		if($("#iq_content").val()==""){
			alert("내용을 입력하세요.");
			return false;
		}
		
		// 회원 이름
		if($("#iq_user_name").val()==""){
			alert("성명을 입력하세요.");
			return false;
		}
		
		reg = /^[가-힣]{2,7}$/;
		if(!reg.test(document.getElementById("iq_user_name").value)){
			alert("성명(한글)은 2~7글자 까지만 허용합니다.");
			return false;
		}
		
		// 이메일
		if($("#iq_user_email").val()==""){
			alert("이메일을 입력하세요.");
			return false;
		}
		
		reg = /^\w{8,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if(!reg.test(document.getElementById("iq_user_email").value)){
			alert("이메일을 잘못입력하였습니다.");
			return false;
		}	
		
		// 연락처
		if($("#iq_user_tel").val()==""){
			alert("연락처를 입력하세요.");
			return false;
		}	
		
		reg = /^\d{3}\d{3,4}\d{4}$/;
		if(!reg.test(document.getElementById("iq_user_tel").value)){
			swal( "입력 오류" , "연락처는 11~13자리까지 허용합니다." , "error" );
			return false;
		}
		
	});
});
</script>
</head>

<section>

	<main class="iqMain">
					
		<div class="iqfoBack">
					
			<span>
				<a href="/crown">홈</a>&nbsp;
				/
			</span>
			
			<span>
				<a href="/crown/myPage">맴버</a>&nbsp;
				/
			</span>
			
			<span>
				&nbsp;<a id="iqbNow">문의하기</a>&nbsp;
			</span>
					
		</div>	
		
		<div class="iqPwdTop">
		
			<div class="iqPwdMenu_title">
			
				<div class="mePwdMenu">
					
					<div style="position:relative">
					<i class="xi-bars xi-3x" id="a3" style="position:absolute; left: 8px"></i><i class="xi-close xi-3x" id="b3" style="position:absolute;display:none; left: 5px"></i>
					</div>
					<span style="margin-top:15px; margin-left:11.5px; color:black;">menu</span>
					<div id="iqmenuList">

						<div class="iqsubMenu">
									
							<a href="/crown/myPage" class="subText">나의 멤버십 정보 </a><br/>
										
							<a href="/crown/infoPwd" class="subText">회원정보</a>
										
						</div>
									
						<div class="iqsubMenu">
									
							<a href="<%=ctx%>/rsAllSearchOk?user_id=${user_id}" class="subText">예약내용</a><br/>
										
							<a href="/crown/withDrawal" class="subText">회원탈퇴</a>													
						</div>
						
						<div class="iqsubMenu">
									
							<a href="/crown/inquiry" class="subText">문의하기</a><br/>
																		
						</div>
								
					</div>
					
				</div>
			
			
				<span id="iqTitle">문의하기</span><br/>
				<span id="iqTitle2"></span>
			
			</div>
			
		</div>	
		
		<div class="iqPwd">
			
				<form method="post" action="/crown/inquiryOk" id="inquiry">
					
					<div id="iqPC">
					
						<div id="iqPC_d">
						
							<span>질문유형</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<select class="iqPC_dt2" style="width: 794px;" name="iq_type">
								<option>크라운리워즈가입</option>
								<option>포인트적립/사용</option>
								<option>포인트조정</option>
								<option>기타</option>
							</select>			
							
							<span>제목</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<input type="text" class="mePC_dt2" style="width: 794px;" name="iq_title" id="iq_title">
							
							<span>내용</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<textarea class="wdPC_dt3" style="width: 794px; height: 170px; resize: none;" name="iq_content" id="iq_content"></textarea>
							
							<span>성명(한글)</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<input type="text" value= "${user_name}" class="iqPC_dt2" style="width: 794px;" name="iq_user_name" id="iq_user_name">
							
							<span>이메일</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<input type="text" value="${vo.user_email}"  class="iqPC_dt2" style="width: 794px;" name="iq_user_email" id="iq_user_email">
						
							<span>연락처</span><label style="color: #F1825B; position: relative; right: 305px; font-size: 20px">*</label><br/>
							<select id="iqPC_d2C">
						
								<option value="모바일" style="background-color: F5F5F5">모바일</option>
	   							<option value="자택" style="background-color: F5F5F5">자택</option>
						
							</select>
							<input type="text" value="${vo.tel_number}" class="iqPC_dt2" style="width: 638px;" name="iq_user_tel" id="iq_user_tel">
							
						</div>
						
						
					
					</div>

					<div id="butWrap">
						
						
						<input type="submit" value="확인" id="iqfoConfirm"><input type="button" value="취소" id="iqfoCancel" onClick="history.back();">
					
					</div>
					
				</form>
		</div>
		
	</main>
	
</section>
</body>
</html>