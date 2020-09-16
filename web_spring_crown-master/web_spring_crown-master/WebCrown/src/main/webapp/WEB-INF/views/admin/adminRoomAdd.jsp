<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	$(function(){
		$(document).on('change','#selectRoomType',function(){
			getRoomNameAjax();
		});
		
		$(document).on('change','#selectMaxAdult',function(){
			var adultState = $("#selectMaxAdult option:selected").val();
			var childState = $("#selectMaxChild option:selected").val();
			
			if(adultState=="1"){
				console.log("어른 최대 : adultState = "+adultState);
				$("#selectMaxChild option[value*='0']").prop('disabled',false);
				$("#selectMaxChild option[value*='1']").prop('disabled',false);
				$("#selectMaxChild option[value*='2']").prop('disabled',false);
			}
			if(adultState == "2"){
				console.log("어른 최대 : adultState = "+adultState);
				$("#selectMaxChild option[value*='0']").prop('disabled',false);
				$("#selectMaxChild option[value*='1']").prop('disabled',false);
				$("#selectMaxChild option[value*='2']").prop('disabled',true);
			}
			if(adultState=="3"){
				console.log("어른 최대 : adultState = "+adultState);
				$("#selectMaxChild option[value*='0']").prop('disabled',false);
				$("#selectMaxChild option[value*='1']").prop('disabled',true);
				$("#selectMaxChild option[value*='2']").prop('disabled',true);
			}
		});
		
		$(document).on('change','#selectMaxChild',function(){
			var childState = $("#selectMaxChild option:selected").val();
			
			if(childState == "0"){
				console.log("아이 최대 : childState = "+childState);
				$("#selectMaxAdult option[value*='1']").prop('disabled',false);
				$("#selectMaxAdult option[value*='2']").prop('disabled',false);
				$("#selectMaxAdult option[value*='3']").prop('disabled',false);
			}
			if(childState == "1"){
				console.log("아이 최대 : childState = "+childState);
				$("#selectMaxAdult option[value*='1']").prop('disabled',false);
				$("#selectMaxAdult option[value*='2']").prop('disabled',false);
				$("#selectMaxAdult option[value*='3']").prop('disabled',true);
			}
			if(childState == "2"){
				console.log("아이 최대 : childState = "+childState);
				$("#selectMaxAdult option[value*='1']").prop('disabled',false);
				$("#selectMaxAdult option[value*='2']").prop('disabled',true);
				$("#selectMaxAdult option[value*='3']").prop('disabled',true);
			}
		});
		
		$(document).on('keyup','#inpRoomNum',function(){
			console.log("키업");
			getRoomNumAjax();
			if(resultData>0){
				alert("이미 존재하는 호수입니다.");
				$("#inpRoomNum").val("");
			}
		});
		
		
		getRoomNameAjax();
	});
	
	//객실타입 이름 ajax로 얻어오기
	function getRoomNameAjax(){
		var url = "<%=ctx%>/adminGetRoomTypeRecordAjax";
		var option = document.getElementById("selectRoomType");
		var params = {"room_type" : option.value};
		
		$.ajax({
			url : url,
			data : params,
			type : "POST",
			success : function(result){
				var $result = $(result);
				console.log("ajax 리턴값   $result:"+ $result);
				var tag = "";
				$result.each(function(i, vo){
					tag += "<option value='"+vo.room_type_code+"'>"+vo.room_name+"</option>";
					console.log("ajax 리턴값  객실이름 :"+ vo.room_name);
				});
				
				document.getElementById("selectRoomName").innerHTML = tag;
			},
			error :function(e){
				console.log(e.responseText);
			}
		});	
	}
	
	var resultData;
	//객실 호수 데이터베이스에 존재여부 ajax로 확인하여 리턴 int 0:없고, 1:있다
	function getRoomNumAjax(){
		var url = "<%=ctx%>/adminGetRoomNumAjax";
		var roomNum = document.getElementById("inpRoomNum").value;
		var params = {"room_num" : roomNum};
		$.ajax({
			url : url,
			data : params,
			async : false,
			type : "POST",
			success : function(result){
				resultData = result;
			},
			error : function(e){
				console.log(e.responseText);
			}
		});
	}
</script>
		<!-- content -->
		<div class="admin_content_wrap">
			<form method="post" id="roomFrm" action="<%=ctx%>/adminRoomAddOk">
				<div class="admin_content_top">
					<div class="admin_content_title">
						<h2>객실 등록 페이지</h2>
						<div class="admin_btn_box">
			  				<input class="admin_btn" type="submit" value="등록"/>
			  				<input class="admin_btn" type="reset" value="Reset"/>
		   				</div>
					</div>
				</div>
				
				<div class="admin_content_box admin_half_w ">
					
					<div class="admin_content_form">
						<div class="admin_input_frm">
							<div>객실 호수</div>
							<input id="inpRoomNum" type="text" name="room_num">
						</div>
					</div>
					<div class="admin_content_form">
						<div class="admin_input_frm">
							<div>객실 타입</div> 
							<select id="selectRoomType" name="room_type">
		 						<option value="스탠다드" selected>스탠다드</option>
		 						<option value="클럽 플로어">클럽 플로어</option>
		 						<option value="스위트">스위트</option>
			  				</select>
						</div>
					</div>
					<div class="admin_content_form">
						<div class="admin_input_frm">
							<div>객실 이름</div>
							<select id="selectRoomName" name="room_type_code">
								<!-- room_type_code 값을 name에 담아서 submit -->
							</select>
						</div>
					</div>
					<div class="admin_content_form">
						<div class="admin_input_frm">
							<div>배드 타입</div>
							<select name="bed">
		 						<option value="트윈" selected>트윈</option>
		 						<option value="더블">더블</option>
		 						<option value="트리플">트리플</option>
			  				</select>
						</div>
					</div>
					
					
				</div><!-- admin_content_box -->
				<div class="admin_content_box admin_half_w ">
					<div class="admin_content_form">
						<div class="admin_input_frm">
							<div>최대인원(어른)</div>
							<select id="selectMaxAdult" name="max_adult">
		 						<option value="1" selected>1</option>
		 						<option value="2">2</option>
		 						<option value="3">3</option>
			  				</select>
						</div>
					</div>
					<div class="admin_content_form">
						<div class="admin_input_frm">
							<div>최대인원(아이)</div>
							<select id="selectMaxChild" name="max_child">
		 						<option value="0" selected>0</option>
		 						<option value="1">1</option>
		 						<option value="2">2</option>
			  				</select>
						</div>
					</div>
				</div>
			</form>
		</div><!-- content -->
	</div><!-- admin_main_container -->
</section>