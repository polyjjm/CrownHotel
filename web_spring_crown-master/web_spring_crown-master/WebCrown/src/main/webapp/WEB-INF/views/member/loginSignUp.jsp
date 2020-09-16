<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<meta charset="UTF-8">
<script>

    $(function(){ 
   function email(url,params,msg){
   $.ajax({
      url : url,
      data : params,
      success : function(result){
         if(result=="ok"){
            alert(msg);
         }else if(result=="yes"){
            $("#emailCheckResult").val("yes");
            alert(msg);
         }else{
            alert("인증코드가 일치하지 않습니다.. 다시 시도해주세요.");
         }
      },
      error : function(){
         console.log("이메일 에러 ...");
      }
   });
   }
 //이메일 중복검사
  // $(document).on("click",'#signUpBtnFirstCheke',function(){
  //    var params = "user_email_check="+$("#loginSignUpEmailCheck").val(); 
   //   var msg = "이메일 중복검사.";
   //   email(params,msg);
  // });
//이메일 인증코드 받기  
   $(document).on("click",'#signUpBtnFirst',function(){
      var url="<%=ctx%>/sendEmail";
      var params = "user_email="+$("#loginSignUpEmail").val(); 
      var msg = "이메일로 인증코드를 전송하였습니다.";
      email(url,params,msg);
   });
//이메일 인증하기 
   $(document).on("click",'#codeBtn',function(){
      var url="<%=ctx%>/sendCodeEmail";
      var params = "user_code_email="+$("#user_code_email").val();
      var msg = "이메일 인증이 완료 되었습니다.";
      email(url,params,msg);
   });
});
   </script>

<script>

$(function(){
	$("#signUpBtnFirst").click(function(){
		if($("#loginSignUpEmail").val()==""){
			alert("이메일을 입력하세요.");
			return false;
		}
		$("#emailText").css("display","none");
		
		$("#emailCodeText").css("display","block");
	});
});

//아이디 중복체크
$(function windowOpen(){
	//아이디 중복검사 유뮤
	$("#signUpBtnSecond").click(function(){//
	window.open('idCheck?user_id='+$("#loginSignUpId").val(),'id','width=470,height=200');
	
	});
	//중복검사하지않은 아이디는 N으로 변경한다.
	$("#signUpBtnSecond").click(function(){//버튼에 있는 아이디 값
		$("#idStatus").val("Y");
	});
	
});

//이메일 중복체크
//$(function windowOpen(){
	//이메일 중복검사 유뮤
//	$("#signUpBtnFirst").click(function(){//
//	window.open('emailCheck?user_email='+$("#loginSignUpEmail").val(),'email','width=470,height=200');
	
//	});
	//중복검사하지않은 아이디는 N으로 변경한다.
//	$("#signUpBtnFirstCheke").click(function(){//버튼에 있는 아이디 값
//		$("#emailStatus").val("Y");
//	});
	
//});

	





$(function(){
	$("#loginSignUpForm").submit(function(){
		
		if($("#loginSignUpFirstNameEn").val()==""){
			alert("성(영문)을 입력하시오.");
			return false;
		}
		//영문 성
		reg = /^[a-zA-Z]{2,10}$/;
		console.log("정규식");
		
		if(!reg.test(document.getElementById("loginSignUpFirstNameEn").value)){//name 값으로 받는다.
			alert("성(영문)은 영어 2~10자리 까지만 허용합니다.");
			return false;
		}
		
		if($("#loginSignUpSceondEn").val()==""){
			alert("이름(영문)을 입력하시오.");
			return false;
		}
		//영문 이름
		reg = /^[a-zA-Z]{2,15}$/;
		if(!reg.test(document.getElementById("loginSignUpSceondEn").value)){
			alert("이름(영문)은 영어 2~15자리 까지만 허용합니다.");
			return false;
		}
		//국가
		if($("#signUpFromSelect").val()==""){
			alert("국가를 입력 하세요.");
			return false;
		}
		//성명 한글
		if($("#loginSignUpNameKr").val()==""){
			alert("성명(한글)을 입력하시오.");
			return false;
		}
		reg = /^[가-힣]{2,7}$/;
		if(!reg.test(document.getElementById("loginSignUpNameKr").value)){
			alert("성명(한글)은 2~7글자 까지만 허용합니다.");
			return false;
		}
		//연락처
		if($("#loginSignUpTel").val()==""){
			alert("연락처를 입력하시오.");
			return false;
		}
		reg = /^\d{3}\d{3,4}\d{4}$/;
		if(!reg.test(document.getElementById("signUpTel").value)){
			alert("연락처는 10~11자리 까지만 허용합니다.");
			return false;
		}
		if($("#signUpTel").val()==""){
			alert("연락처를 입력하시오.");
			return false;
		}
		
		if($("#loginSignUpEmail").val()==""){
			alert("이메일 인증을 하시오.");
			return false;
		}
		//아이디
		reg = /^[a-zA-Z]{1}\w{4,19}$/;
		if(!reg.test(document.getElementById("loginSignUpId").value)){
			alert("아이디는 첫번째문자는 영문자, 영, 숫자, _만 허용, 5~20글자까지만 허용합니다.");
			return false;
		}
		if($("#idStatus").val()=="N"){
			alert("아이디를 중복체크를하세요.");
			return false;
		}
		if($("#loginSignUpPwd").val()==""){
			alert("비밀번호를 입력하시오.");
			return false;
		}
		//비밀번호
		reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;//[a-aA-Z][0-9]_ = \w
		if(!reg.test(document.getElementById("loginSignUpPwd").value)){
			alert("비밀번호는 영문,숫자 포함8~20자리 까지만 허용합니다.");
			return false;
		}
		if($("#loginSignUpPwdCheck").val()==""){
			alert("비밀번호 확인을 입력하시오.");
			return false;
		}
		//비밀번호 확인
		reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
		if(!reg.test(document.getElementById("loginSignUpPwdCheck").value)){
			alert("비밀번호확인은 8~20자리 까지만 허용합니다.");
			return false;
		}
		if($("#loginSignUpPwd").val() != $("#loginSignUpPwdCheck").val()){
			alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
			return false;
		}
		
		//년도
		if($("#signUpSelectYear").val()==""){
			alert("년도를 입력 하세요.");
			return false;
		}
		//월
		if($("#signUpSelectMonth").val()==""){
			alert("월을 입력 하세요.");
			return false;
		}
		//일
		if($("#signUpSelectDay").val()==""){
			alert("일을 입력 하세요.");
			return false;
		}
		//연락처 메뉴
		if($("#signUpTelMenu").val()==""){
			alert("연락처 메뉴를 입력 하세요.");
			return false;
		}
		//국적 연락처
		if($("#signUpTelFrom").val()==""){
			alert("국적(번호) 입력 하세요.");
			return false;
		}
	
		
		
		
		//이메일
		reg = /^\w{8,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if(!reg.test(document.getElementById("loginSignUpEmailCheck").value)){
			alert("이메일을 잘못입력하였습니다.");
			return false;
		}
		
		if($("#loginSignUpId").val()==""){
			alert("아이디를 입력하시오.");
			return false;
		}
	
		
		

	});
	
	//이메일 인증 검사 여부
	$(document).on('click','#signUpNext',function(){
		if($("#emailStatus").val()=="N"){
			alert("이메일 인증을 하세요.");	
			return false;
		}
		
	});
	//이메일 체크 검사
	$(function(){//signUpBtnFirst 서브밋 버튼
		$("#signUpBtnFirst").click(function(){
			document.getElementById("emailStatus").value="Y";
		
		});
	});
	//아이디 중복검사 여부
	$(document).on('click','#signUpNext',function(){
		if($("#idStatus").val()=="N"){
			alert("아이디 중복검사를 하세요.");
			return false;
		}
	});
	
});
	
</script>

</head>

<section>
<div>
	<!-- 맨위 상단 홈 ,약관동의  -->
	<div id="signUpBar">
	 	<span class="signUp_home">홈</span> / <span class="signUp_home">Step03.회원 정보 입력</span>
	</div>
	
	<div id="signUpCenter">
		<div>
			<span id="signUpText">회원정보입력</span>
			<div>
			<ul id="signUpList">
				<li><div id="signUpStep1"><p class="signUp_step">Step1</p></div></li>
				<li><div id="signUpStep2"><p class="signUp_step">Step2</p></div></li>
				<li><div id="signUpStep3"><p class="signUp_step">Step3</p></div></li>
			</ul>
			</div>
		</div>
		
		<div id="signUpInfRe">
		<div id="signUpInf">필수정보입력</div><p id="signUpRe">*필수입력</p>
		</div>
		
		<form method="post" id="loginSignUpForm" action="<%=request.getContextPath()%>/loginSignUpOk">
		<div>
			<div class="signUp_name"><b>성명(영문)</b><span class="signUp_st">*</span></div>
			<div id="signUpNameBox"><input type="text" name="name_first" id="loginSignUpFirstNameEn" placeholder="성(영문)" class="signUp_name_inputen"/> <input type="text" name="name_last" id="loginSignUpSceondEn" placeholder="이름(영문)" class="signUp_name_inputen"/></div>
		</div>
		
		<div>
			<div id="signUpFrom" name="nara"><b>국가</b><span class="signUp_st">*</span></div>
			<div>
				<select id="signUpFromSelect" name="country" >
					<option value="">국가(FROM)</option>
					<option value="KOREA">KOREA</option>
					<option value="JAPAN" >JAPAN</option>
					<option value="CANADA" >CANADA</option>
					<option value="CHAINA" >CHAINA</option>
					
				</select>
			
			</div>
		</div>
		
		<div>
			<div class="signUp_name"><b>성명(한글)</b><span class="signUp_st">*</span></div>
			<div><input type="text" name="user_name"  id="loginSignUpNameKr" placeholder="성명(한글)" class="signUp_name_input"/></div>
		</div>
	
		<div>
			<div class="signUp_name"><b>생년월일</b><span class="signUp_st">*</span></div>
			<div>
			<select class="signUp_day" name="year" id="signUpSelectYear">
					<option value="">년도(YYYY)</option>
					<option value="2001" >2001</option>
					<option value="2000" >2000</option>
					<option value="1999" >1999</option>
					<option value="1998" >1998</option>
					<option value="1997" >1997</option>
					<option value="1996" >1996</option>
					<option value="1995" >1995</option>
					<option value="1994" >1994</option>
					<option value="1993" >1993</option>
					<option value="1992" >1992</option>
					<option value="1991" >1991</option>
					<option value="1990" >1990</option>
			</select>
			
			<select class="signUp_day" name="month" id="signUpSelectMonth">
					<option value="">월(MM)</option>
					<option value="01" >01</option>
					<option value="02" >02</option>
					<option value="03" >03</option>
					<option value="04" >04</option>
					<option value="05" >05</option>
					<option value="06" >06</option>
					<option value="07" >07</option>
					<option value="08" >08</option>
					<option value="09" >09</option>
					<option value="10" >10</option>
					<option value="11" >11</option>
					<option value="12" >12</option>
			</select>
			
			<select class="signUp_day" name="day" id="signUpSelectDay">
					<option value="">일(DD)</option>
					<option value="01" >01</option>
					<option value="02" >02</option>
					<option value="03" >03</option>
					<option value="04" >04</option>
					<option value="05" >05</option>
					<option value="06" >06</option>
					<option value="07" <c:if test="${vo.day=='07' }">selected</c:if>>07</option>
					<option value="08" <c:if test="${vo.day=='08' }">selected</c:if>>08</option>
					<option value="09" <c:if test="${vo.day=='09' }">selected</c:if>>09</option>
					<option value="10" <c:if test="${vo.day=='10' }">selected</c:if>>10</option>
					<option value="11" <c:if test="${vo.day=='11' }">selected</c:if>>11</option>
					<option value="12" <c:if test="${vo.day=='12' }">selected</c:if>>12</option>
					<option value="13" <c:if test="${vo.day=='13' }">selected</c:if>>13</option>
					<option value="14" <c:if test="${vo.day=='14' }">selected</c:if>>14</option>
					<option value="15" <c:if test="${vo.day=='15' }">selected</c:if>>15</option>
					<option value="16" <c:if test="${vo.day=='16' }">selected</c:if>>16</option>
					<option value="17" <c:if test="${vo.day=='17' }">selected</c:if>>17</option>
					<option value="18" <c:if test="${vo.day=='18' }">selected</c:if>>18</option>
					<option value="19" <c:if test="${vo.day=='19' }">selected</c:if>>19</option>
					<option value="20" <c:if test="${vo.day=='20' }">selected</c:if>>20</option>
					<option value="21" <c:if test="${vo.day=='21' }">selected</c:if>>21</option>
					<option value="22" <c:if test="${vo.day=='22' }">selected</c:if>>22</option>
					<option value="23" <c:if test="${vo.day=='23' }">selected</c:if>>23</option>
					<option value="24" <c:if test="${vo.day=='24' }">selected</c:if>>24</option>
					<option value="25" <c:if test="${vo.day=='25' }">selected</c:if>>25</option>
					<option value="26" <c:if test="${vo.day=='26' }">selected</c:if>>26</option>
					<option value="27" <c:if test="${vo.day=='27' }">selected</c:if>>27</option>
					<option value="28" <c:if test="${vo.day=='28' }">selected</c:if>>28</option>
					<option value="29" <c:if test="${vo.day=='29' }">selected</c:if>>29</option>
					<option value="30" <c:if test="${vo.day=='30' }">selected</c:if>>30</option>
					<option value="31" <c:if test="${vo.day=='31' }">selected</c:if>>31</option>
			</select>	
			</div>
		</div>
	
		<div>
			<div class="signUp_subject"><b>연락처</b><span class="signUp_st">*</span></div>
			<div>
			<select class="signUp_day" name="tel_menu" id="signUpTelMenu">
					<option value="">연락처(Tel)</option>
					<option value="모바일" <c:if test="${vo.tel_menu=='모바일' }">selected</c:if>>모바일</option>
					<option value="자택" <c:if test="${vo.tel_menu=='자택' }"></c:if>>자택</option>
			</select>
			
			<select class="signUp_day" name="tel_from" id="signUpTelFrom">
				<option value="">직접선택</option>											
				<option value="02" <c:if test="${vo.tel_from=='02'}">selected</c:if>>대한민국(02)</option>
				<option value="233" <c:if test="${vo.tel_from=='233' }">selected</c:if>>가나(233)</option>
				<option value="241" <c:if test="${vo.tel_from=='241' }">selected</c:if>>가봉(241)</option>
				<option value="592" <c:if test="${vo.tel_from=='592' }">selected</c:if>>가이아나(592)</option>
				<option value="220" <c:if test="${vo.tel_from=='220' }">selected</c:if>>감비아(220)</option>
				<option value="590" <c:if test="${vo.tel_from=='590' }">selected</c:if>>과델로프(590)</option>
				<option value="502" <c:if test="${vo.tel_from=='502' }">selected</c:if>>과테말라(502)</option>
				<option value="671" <c:if test="${vo.tel_from=='671' }">selected</c:if>>괌(671)</option>
				<option value="39+6" <c:if test="${vo.tel_from=='39+6' }">selected</c:if>>교황청(39+6)</option>
				<option value="1+809" <c:if test="${vo.tel_from=='1+809' }">selected</c:if>>그레나다(1+809)</option>
				<option value="30" <c:if test="${vo.tel_from=='30' }">selected</c:if>>그리스(30)</option>
				<option value="299" <c:if test="${vo.tel_from=='299' }">selected</c:if>>그린랜드(299)</option>
				<option value="245" <c:if test="${vo.tel_from=='245' }">selected</c:if>>기네비소(245)</option>
				<option value="224" <c:if test="${vo.tel_from=='224' }">selected</c:if>>기니(224)</option>
				<option value="264" <c:if test="${vo.tel_from=='264' }">selected</c:if>>나미비아(264)</option>
				<option value="674" <c:if test="${vo.tel_from=='674' }">selected</c:if>>나우르(674)</option>
				<option value="234" <c:if test="${vo.tel_from=='234' }">selected</c:if>>나이지리아(234)</option>
				<option value="27" <c:if test="${vo.tel_from=='27' }">selected</c:if>>남아프리카(27)</option>
				<option value="31" <c:if test="${vo.tel_from=='31' }">selected</c:if>>네덜란드(31)</option>
				<option value="977" <c:if test="${vo.tel_from=='977' }">selected</c:if>>네팔(977)</option>
				<option value="47" <c:if test="${vo.tel_from=='47' }">selected</c:if>>노르웨이(47)</option>
				<option value="687" <c:if test="${vo.tel_from=='687' }">selected</c:if>>뉴 칼레도니아(687)</option>
				<option value="64" <c:if test="${vo.tel_from=='64' }">selected</c:if>>뉴질랜드(64)</option>
				<option value="683" <c:if test="${vo.tel_from=='683' }">selected</c:if>>니우에(683)</option>
				<option value="227" <c:if test="${vo.tel_from=='227' }">selected</c:if>>니제르(227)</option>
				<option value="505" <c:if test="${vo.tel_from=='505' }">selected</c:if>>니카라과(505)</option>
				<option value="886" <c:if test="${vo.tel_from=='886' }">selected</c:if>>대만(886)</option>
				<option value="82" <c:if test="${vo.tel_from=='82' }">selected</c:if>>대한민국(82)</option>
				<option value="45" <c:if test="${vo.tel_from=='45' }">selected</c:if>>덴마크(45)</option>
				<option value="1+809" <c:if test="${vo.tel_from=='1+809' }">selected</c:if>>도미니카(1+809)</option>
				<option value="1+829" <c:if test="${vo.tel_from=='1+829' }">selected</c:if>>도미니카 공화국(1+809)</option>
				<option value="49" <c:if test="${vo.tel_from=='49' }">selected</c:if>>독일(49)</option>
				<option value="856" <c:if test="${vo.tel_from=='856' }">selected</c:if>>라오스(856)</option>
				<option value="231" <c:if test="${vo.tel_from=='231' }">selected</c:if>>라이베리아(231)</option>
				<option value="371" <c:if test="${vo.tel_from=='371' }">selected</c:if>>라트비아(371)</option>
				<option value="7" <c:if test="${vo.tel_from=='7' }">selected</c:if>>러시아(7)</option>
				<option value="961" <c:if test="${vo.tel_from=='961' }">selected</c:if>>레바논(961)</option>
				<option value="266" <c:if test="${vo.tel_from=='266' }">selected</c:if>>레소토(266)</option>
				<option value="40" <c:if test="${vo.tel_from=='40' }">selected</c:if>>루마니아(40)</option>
				<option value="250" <c:if test="${vo.tel_from=='250' }">selected</c:if>>루안다(250)</option>
				<option value="352" <c:if test="${vo.tel_from=='352' }">selected</c:if>>룩셈부르그(352)</option>
				<option value="218" <c:if test="${vo.tel_from=='218' }">selected</c:if>>리비아(218)</option>
				<option value="370" <c:if test="${vo.tel_from=='370' }">selected</c:if>>리투아니아(370)</option>
				<option value="423"<c:if test="${vo.tel_from=='423' }">selected</c:if>>리히텐슈타인(423)</option>
				<option value="261"<c:if test="${vo.tel_from=='261' }">selected</c:if>>마다카스카르(261)</option>
				<option value="692"<c:if test="${vo.tel_from=='692' }">selected</c:if>>마샬군도(692)</option>
				<option value="691"<c:if test="${vo.tel_from=='691' }">selected</c:if>>마이크로네시아(691)</option>
				<option value="853"<c:if test="${vo.tel_from=='853' }">selected</c:if>>마카오(853)</option>
				<option value="265"<c:if test="${vo.tel_from=='265' }">selected</c:if>>말라위(265)</option>
				<option value="60"<c:if test="${vo.tel_from=='60' }">selected</c:if>>말레이지아(60)</option>
				<option value="223"<c:if test="${vo.tel_from=='223' }">selected</c:if>>말리(223)</option>
				<option value="52"<c:if test="${vo.tel_from=='52' }">selected</c:if>>멕시코(52)</option>
				<option value="377"<c:if test="${vo.tel_from=='377' }">selected</c:if>>모나코(377)</option>
				<option value="212"<c:if test="${vo.tel_from=='212' }">selected</c:if>>모로코(212)</option>
				<option value="230"<c:if test="${vo.tel_from=='230' }">selected</c:if>>모리셔스(230)</option>
				<option value="222"<c:if test="${vo.tel_from=='222' }">selected</c:if>>모리타니(222)</option>
				<option value="258"<c:if test="${vo.tel_from=='258' }">selected</c:if>>모잠비크(258)</option>
				<option value="373"<c:if test="${vo.tel_from=='373' }">selected</c:if>>몰도바(373)</option>
				<option value="960"<c:if test="${vo.tel_from=='960' }">selected</c:if>>몰디브(960)</option>
				<option value="356"<c:if test="${vo.tel_from=='356' }">selected</c:if>>몰타(356)</option>
				<option value="976"<c:if test="${vo.tel_from=='976' }">selected</c:if>>몽골(976)</option>
				<option value="1"<c:if test="${vo.tel_from=='1' }">selected</c:if>>미국(1)</option>
				<option value="2+809"<c:if test="${vo.tel_from=='2+809' }">selected</c:if>>미령 버진군도(1+809)</option>
				<option value="95"<c:if test="${vo.tel_from=='95' }">selected</c:if>>미얀마(95)</option>
				<option value="678"<c:if test="${vo.tel_from=='678' }">selected</c:if>>바누아투(678)</option>
				<option value="973"<c:if test="${vo.tel_from=='973' }">selected</c:if>>바레인(973)</option>
				<option value="1+246"<c:if test="${vo.tel_from=='1+246' }">selected</c:if>>바베이도스(1+246)</option>
				<option value="1+242"<c:if test="${vo.tel_from=='1+242' }">selected</c:if>>바하마(1+242)</option>
				<option value="880"<c:if test="${vo.tel_from=='880' }">selected</c:if>>방글라데시(880)</option>
				<option value="1+441"<c:if test="${vo.tel_from=='1+441' }">selected</c:if>>버뮤다(1+441)</option>
				<option value="58"<c:if test="${vo.tel_from=='58' }">selected</c:if>>베네주엘라(58)</option>
				<option value="229"<c:if test="${vo.tel_from=='229' }">selected</c:if>>베닝(229)</option>
				<option value="375"<c:if test="${vo.tel_from=='375' }">selected</c:if>>베라루스(375)</option>
				<option value="84"<c:if test="${vo.tel_from=='84' }">selected</c:if>>베트남(84)</option>
				<option value="32"<c:if test="${vo.tel_from=='32' }">selected</c:if>>벨기에(32)</option>
				<option value="501"<c:if test="${vo.tel_from=='501' }">selected</c:if>>벨리제(501)</option>
				<option value="387"<c:if test="${vo.tel_from=='387' }">selected</c:if>>보스니아-헤르체고비나(387)</option>
				<option value="267"<c:if test="${vo.tel_from=='267' }">selected</c:if>>보츠와나(267)</option>
				<option value="591"<c:if test="${vo.tel_from=='591' }">selected</c:if>>볼리비아(591)</option>
				<option value="257"<c:if test="${vo.tel_from=='257' }">selected</c:if>>부룬디(257)</option>
				<option value="226"<c:if test="${vo.tel_from=='226' }">selected</c:if>>부르키나 파소(226)</option>
				<option value="975"<c:if test="${vo.tel_from=='975' }">selected</c:if>>부탄(975)</option>
				<option value="850"<c:if test="${vo.tel_from=='850' }">selected</c:if>>북한(850)</option>
				<option value="359"<c:if test="${vo.tel_from=='359' }">selected</c:if>>불가리아(359)</option>
				<option value="594"<c:if test="${vo.tel_from=='594' }">selected</c:if>>불령 가이아나(594)</option>
				<option value="262"<c:if test="${vo.tel_from=='262' }">selected</c:if>>불령 리유니온,코모도 제도(262)</option>
				<option value="55"<c:if test="${vo.tel_from=='55' }">selected</c:if>>브라질(55)</option>
				<option value="673"<c:if test="${vo.tel_from=='673' }">selected</c:if>>브루나이(673)</option>
				<option value="966"<c:if test="${vo.tel_from=='966' }">selected</c:if>>사우디아라비아(966)</option>
				<option value="357"<c:if test="${vo.tel_from=='357' }">selected</c:if>>사이프러스(357)</option>
				<option value="39"<c:if test="${vo.tel_from=='39' }">selected</c:if>>산마리노(39)</option>
				<option value="221"<c:if test="${vo.tel_from=='221' }">selected</c:if>>세네갈(221)</option>
				<option value="248"<c:if test="${vo.tel_from=='248' }">selected</c:if>>세이쉘(248)</option>
				<option value="1+758"<c:if test="${vo.tel_from=='1+758' }">selected</c:if>>세인트 루시아(1+758)</option>
				<option value="1+809"<c:if test="${vo.tel_from=='1+809' }">selected</c:if>>세인트 빈센트 그레나딘(1+809)</option>
				<option value="6+809"<c:if test="${vo.tel_from=='6+890' }">selected</c:if>>세인트 키츠 네비스(1+809)</option>
				<option value="290"<c:if test="${vo.tel_from=='290' }">selected</c:if>>세인트 헬레나(290)</option>
				<option value="252"<c:if test="${vo.tel_from=='252' }">selected</c:if>>소말리아(252)</option>
				<option value="677"<c:if test="${vo.tel_from=='677' }">selected</c:if>>솔로몬 군도(677)</option>
				<option value="249"<c:if test="${vo.tel_from=='249' }">selected</c:if>>수단(249)</option>
				<option value="597"<c:if test="${vo.tel_from=='597' }">selected</c:if>>수리남(597)</option>
				<option value="94"<c:if test="${vo.tel_from=='94' }">selected</c:if>>스리랑카(94)</option>
				<option value="268"<c:if test="${vo.tel_from=='268' }">selected</c:if>>스와질랜드(268)</option>
				<option value="46"<c:if test="${vo.tel_from=='46' }">selected</c:if>>스웨덴(46)</option>
				<option value="41"<c:if test="${vo.tel_from=='41' }">selected</c:if>>스위스(41)</option>
				<option value="34"<c:if test="${vo.tel_from=='34' }">selected</c:if>>스페인(34)</option>
				<option value="42"<c:if test="${vo.tel_from=='42' }">selected</c:if>>슬로바키아(42)</option>
				<option value="386"<c:if test="${vo.tel_from=='386' }">selected</c:if>>슬로베니아(386)</option>
				<option value="963"<c:if test="${vo.tel_from=='963' }">selected</c:if>>시리아(963)</option>
				<option value="232"<c:if test="${vo.tel_from=='232' }">selected</c:if>>시에라 리온(232)</option>
				<option value="65"<c:if test="${vo.tel_from=='65' }">selected</c:if>>싱가포르(65)</option>
				<option value="971"<c:if test="${vo.tel_from=='971' }">selected</c:if>>아랍에미리트 연합(971)</option>
				<option value="297+8"<c:if test="${vo.tel_from=='297+8' }">selected</c:if>>아루바(297+8)</option>
				<option value="374"<c:if test="${vo.tel_from=='374' }">selected</c:if>>아르메니아(374)</option>
				<option value="54"<c:if test="${vo.tel_from=='54' }">selected</c:if>>아르헨티나(54)</option>
				<option value="684"<c:if test="${vo.tel_from=='684' }">selected</c:if>>아메리칸 사모아(684)</option>
				<option value="354"<c:if test="${vo.tel_from=='354' }">selected</c:if>>아이슬란드(354)</option>
				<option value="509"<c:if test="${vo.tel_from=='509' }">selected</c:if>>아이티(509)</option>
				<option value="353"<c:if test="${vo.tel_from=='353' }">selected</c:if>>아일랜드(353)</option>
				<option value="994"<c:if test="${vo.tel_from=='994' }">selected</c:if>>아제르바이잔(994)</option>
				<option value="376"<c:if test="${vo.tel_from=='376' }">selected</c:if>>안도라(376)</option>
				<option value="1+810"<c:if test="${vo.tel_from=='1+810' }">selected</c:if>>안티가 바부다(1+809)</option>
				<option value="355"<c:if test="${vo.tel_from=='355' }">selected</c:if>>알바니아(355)</option>
				<option value="213"<c:if test="${vo.tel_from=='213' }">selected</c:if>>알제리(213)</option>
				<option value="244"<c:if test="${vo.tel_from=='244' }">selected</c:if>>앙골라(244)</option>
				<option value="291"<c:if test="${vo.tel_from=='291' }">selected</c:if>>에리트리아(291)</option>
				<option value="372"<c:if test="${vo.tel_from=='372' }">selected</c:if>>에스토니아(372)</option>
			</select>
			
			<input type="text" name="tel_number" placeholder="-빼고 입력" id="signUpTel"/>
					
			</div>
		</div>
		<!-- 이메일 중복검사
		<div id="emailText" style="display:block">
			<div class="signUp_subject"><b>이메일</b><span class="signUp_st">*</span></div>
			<div><input type="text" value="이메일" name="user_email_ckeck"  id="loginSignUpEmailCheck" placeholder="example@lotte.com" class="signUp_name_input"/>
				 <input type="button" name="emailCheckCheck" id="signUpBtnFirstCheke" value="중복검사" >
				 <input type="hidden" id="emailStatus" value="N"/>
			</div>
		</div> -->
		
		<div id="emailText" style="display:block">
			<div class="signUp_subject"><b>이메일</b><span class="signUp_st">*</span></div>
			<div><input type="text" name="user_email"  id="loginSignUpEmail" placeholder="example@lotte.com" class="signUp_name_input"/>
				 <input type="button" name="emailCheck" id="signUpBtnFirst" value="인증코드발송" >
				 <input type="hidden" id="emailStatus" value="N"/> <!-- 이메일 중복검사 -->
			</div>
		</div>
		
		
		<div id="emailCodeText" style="display:none">
			<div class="signUp_subject"><b>이메일 </b><span class="signUp_st">*</span></div>
			<div><input type="text" name="user_code_email"  id="user_code_email" placeholder="인증코드 입력" class="signUp_name_input"/>
				 <input type="button" name="emailCodeCheck" id="codeBtn" value="인증코드확인" >
				 
				 
			</div>
		</div>
		
		<div id="signUpIdInput">
			<div class="signUp_subject"><b>아이디</b><span class="signUp_st">*</span></div>
			<div ><input type="text" name="user_id"  id="loginSignUpId" placeholder="아이디" class="signUp_name_input"/>
				  <input type="button" name="idCheck" id="signUpBtnSecond" value="중복확인" onclick="windowOpen"/>
				  <input type="hidden" id="idStatus" value="N"/><!-- 아이디중복검사 --><br>
			</div>
		
		</div>
		
		<div id="signUpPwdInput">
			<div id="signUpPwd"><b>비밀번호</b><span class="signUp_st">*</span></div>
			
			<div><input type="password" name="user_pwd" value="ho" id="loginSignUpPwd" placeholder="비밀번호" class="signUp_name_pwd"/>
				 <input type="password" name="user_pwd_check" value="ho" id="loginSignUpPwdCheck" placeholder="비밀번호 재입력" class="signUp_name_pwd"/></div>
				  <input type="hidden" id="pwdStatus" value="N"/> <!--비밀번호검사 -->
		</div>
			
			 <div><input type="hidden" name="point" id="point" value="1000"></div> 
			<div><input type="hidden" name="point_content" id="point_content" value="회원가입 포인트">	
			<!-- 버튼 -->
			<div id="signUpBackNext"><input type="reset" value="취소" id="signUpBack"/>&nbsp;<input type="submit" value="다음" id="signUpNext"/></div>
		</form>
	
</div>			<!--class="signUp_nameInput -->
</div>
</section>
