<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!-- content -->
		<div class="admin_content_wrap">
			<div class="admin_content_top">
				<div class="admin_content_title"><h2>관리자 페이지</h2></div>
			</div>
			<div class="admin_content_box"></div>
			
			<div class="admin_content_box">
	
				<div class="admin_content_form">
					<canvas id="myChart" width="1200px" height="300"></canvas>
					<div>
						<div>
							<table class="table">
								 <thead class="thead-light">
								 	<tr>
									 	<th>1월</th>
									 	<th>2월</th>
									 	<th>3월</th>
									 	<th>4월</th>
									 	<th>5월</th>
									 	<th>6월</th>
									 	<th>7월</th>
									 	<th>8월</th>
									 	<th>9월</th>
									 	<th>10월</th>
									 	<th>11월</th>
									 	<th>12월</th>
								 	</tr>
								 </thead>
								 <tbody>
								 	<tr>
								 		<td class="1"></td>
										<td class="2"></td>
										<td class="3"></td>
										<td class="4"></td>
										<td class="5"></td>
										<td class="6"></td>
										<td class="7"></td>
										<td class="8"></td>
										<td class="9"></td>
										<td class="10"></td>
										<td class="11"></td>
										<td class="12"></td>
								 	</tr>
								 </tbody>
							</table>
							
						</div>
						총매출 : <span class="cntprice"></span>
					</div>
				</div>
				
				
				
			</div>
		</div><!-- admin_content_wrap -->
		
	</div>
</section>