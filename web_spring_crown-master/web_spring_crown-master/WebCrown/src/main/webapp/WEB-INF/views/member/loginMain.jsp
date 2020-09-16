<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<script language="javascript">






	$(document).submit(function(){
		
		if($(':radio[id="loginMainTrue1"]:checked').length <1){
			alert("1.크라운호텔 리워즈 회원관련 동의 체크 해주십시오.");
			return false;
		}
		if($(':radio[id="loginMainTrue2"]:checked').length <1){
			alert("2.개인정보의 수집·이용에 관한 사항 해주십시오.");
			return false;
		}
	});
</script>
</head>


<section>
<div>
	<!-- 맨위 상단 홈 ,약관동의  -->
	<div id="loginMainBar">
	 	<span class="loginMain_home">홈</span> / <span class="loginMain_home">Step02.약관동의</span>
	</div>
	<!-- 전체 중앙배치div -->
	<div id="loginMainCenter">
	<!-- setep -->
	<div>
		<span id="loginMainText">약관동의</span>
		<div> 
			<ul id="loginMainList">
				<li><div id="loginMainStep1"><p class="loginMain_step">Step1</p></div></li>
				<li><div id="loginMainStep2"><p class="loginMain_step">Step2</p></div></li>
				<li><div id="loginMainStep3"><p class="loginMain_step">Step3</p></div></li>
			</ul>
		</div>
	</div>
	<!-- 체크박스창 -->
	<div>
		<form method="get" id="loginMainAll" action="<%=request.getContextPath()%>/loginSignUp">
		<div id="loginMainCheckBox">
			<div id="loginMainAllSelect"><input type="checkbox" class="loginMain_check" id="allCheck"/> <label id="loginmainAll">전체동의하기</label></div>
			<p class="loginMain_text">전체 동의는 귀하의 선택사항으로서 귀하는 아래 동의서를 확인한 후 각 항목마다<br/>개별적으로 동의하실 수 있습니다.</p>
		</div>
		
		<div><p class="loginMain_text">크라운호텔 리워즈 회원 가입을 위하여 크라운호텔앤리조트(이하 "회사")에서는<br/> 아래와 같이 개인정보를 수집, 이용 및 제공하고자 합니다.</p></div>
		
		<div>
			<div class="loginMain_mem_nes">
				<div class="loginMain_mem"><b>1.크라운호텔 리워즈 회원관련</b><span id="loginMainNes">(필수)</span></div>
			</div>		
			
				<div>
				<input type="radio" class="loginMain_true" id="loginMainTrue1" name="loginMainTrue1"/>&nbsp;&nbsp;<label class="loginMain_yes">동의</label>
				<input type="radio" class="loginMain_false" id="loginMainFalse1" name="loginMainTrue1" />&nbsp;&nbsp;<label class="loginMain_yes">미동의</label>
				</div>
				<div id="loginMainRw">
				<p class="loginMain_text"><br/>다음 사항들은 롯데호텔앤리조트 롯데호텔 리워즈 (이하 ‘본 프로그램’)의 특별한서비스와<br/> 특전
				 						    및  어워드에 대한 내용에 관한 것입니다. 모든 조항은 롯데호텔앤리조트의 고유 견해<br/>로 회원을 보호하고자
				 						    만들어 졌으며 롯데호텔앤리조트는 롯데호텔 또는 제휴사의 내부사<br/>정및
									            제휴 관계 변경 등에 따라 필요한 경우 본 프로그램 규정, 조건, 특전또는 크라운 호텔<br/>리워즈와 관련된 어워드 등을 변경할 수있습니다.</p>
				</div>
				
			<div class="loginMain_mem_nes">
				<div class="loginMain_mem"><b>2.개인정보의 수집·이용에 관한 사항</b><span id="loginMainNes">(필수)</span></div>
			</div>		
			
				<div>
				<input type="radio" class="loginMain_true" id="loginMainTrue2" name="loginMainTrue2" />&nbsp;&nbsp;<label class="loginMain_yes">동의</label>
				<input type="radio" class="loginMain_false" name="loginMainTrue2" id="loginMainFalse2"/>&nbsp;&nbsp;<label class="loginMain_yes">미동의</label>
				</div>
				<div id="loginMainRw">
				<p class="loginMain_text"><br/>-필수사항 :성명(영문),국가,생년월일,연락처(모바일 또는 자택),<br/>
												이메일, 아이디, 비밀번호, 리워즈 회원번호(자동생성),<br/>롯데호텔(국내 및 해외 체인호텔 포함, 이하 “롯데호텔”)<br/>
												예약 및 투숙정보(투숙기간,숙박료,구매금액 포함),<br/>포인트 적립 및 사용내역, 할인내역, IP/쿠키정보</p>
				</div>
				
			<div class="loginMain_mem_nes">
				<div class="loginMain_mem"><b>3.상품안내 및 마케팅 활용을 위한 개인정보 수집·이용 및 정보 수신에 관한 동의 (선택 )</b></div>
			</div>		
			
				<div>
				<input type="radio" class="loginMain_true" id="loginMainTrue3" name="loginMainTrue3" />&nbsp;&nbsp;<label class="loginMain_yes" >동의</label>
				<input type="radio" class="loginMain_false" name="loginMainTrue3" id="loginMainFalse3"/>&nbsp;&nbsp;<label class="loginMain_yes">미동의</label>
				</div>
				<div id="loginMainLast">
					<div><br/><input type="radio" name="loginMainTrue4" class="loginMain_check" />Email <input type="radio" name="loginMainTrue4" class="loginMain_check"/> SMS</div>
				 <p class="loginMain_text"><br/>국내 및 해외 롯데호텔앤리조트 회원서비스 관련 정보, 할인상품 및 신상품 안내,<br/>
				 								 마케팅 서비스를 위하여 개인정보를 제3자에게 제공하는 것에 동의 합니다.</p>						    
				</div>		
				<div><p id="loginMainSelect">귀하는 위와 같은 개인정보의 수집·이용에 대한 동의를 거부할 수 있으나, 동의 거부 시 정보 수신이 불가능합니다.</p></div>
				
				
			<div id="loginMainBtn"><input type="reset" value="취소" id="loginMainBack"/>&nbsp;<input type="submit" value="다음" id="loginMainNext"/></div>
		
		
		</div>
		
	
	
	
		</form>
	</div>
	</div><!-- 전체 중앙배치div -->
</div>
</section>
