<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section>
<div>
	<div id="findIdBar">
	 	<span class="findIdForm_home">홈</span> / <span class="findIdForm_home">아이디 찾기</span>
	</div>
			<div id="findIdCenter">
				<form method="post" action="<%=ctx%>/idFindOk">
					<div id="findIdSearch"><!----------------------------- 아이디 찾기 -------------------------------------->
						<div>
							
							<div id="findIdText">아이디 찾기</div>
							<span>이름,이메일 정보를 입력하시오.</span>
						</div>
						<div>
							
							<div>
								
								<div id="findIdName">이름</div>
								<input name="user_name"  class="findIdInput" type="text" placeholder="이름"/>
							</div>
							
							
							<div>
								<div class="findIdEmail">이메일</div>
								<input name="user_email" class="findIdInput" type="text"/>
							</div>
							<div >
								<input type="submit" class="findIdBtn" value="아이디 조회"/>
							</div>
						</div>
					</div><!-------------------------------------------- 아이디 찾기 끝----------------------------------------->
				</form>
				
				
				
		</div>

</div>
</section>			



