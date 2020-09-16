<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<section>
<div>
	<div id="findIdBar">
	 	<span class="findIdForm_home">홈</span> / <span class="findIdForm_home">비밀번호 찾기</span>
	</div>
			<div id="findIdCenter">
				
				
				
				<form method="post" action="<%=ctx%>/pwdFindOk">
					<div id="findPwdSearch"><!---------------------------------- 비빌번호 찾기 ------------------------------------------>
						<div>
						
							<div id="findPwdText">비밀번호 찾기</div>
							<span>아이디,이메일 정보를 입력하시오.</span>
						</div>
						<div>
							
							<div>
								
								<div id="findIdId">아이디</div>
								<input type="text" class="findIdInput" name="user_id" placeholder="아이디"/>
							</div>
							
							<div>
								<div class="findIdEmail">이메일</div>
								<input type="text" class="findIdInput" name="user_email"/>
					 		</div>
							<div>
								<input type="submit"  class="findIdBtn" value="비밀번호 조회"/>
							</div>
						</div>
					</div><!---------------------------------- 비빌번호 찾기 끝------------------------------------------>
				</form>
		</div>

</div>
</section>			



