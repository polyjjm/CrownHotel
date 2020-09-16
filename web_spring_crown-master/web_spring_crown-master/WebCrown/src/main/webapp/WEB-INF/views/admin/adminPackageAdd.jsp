<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=ctx %>/css/admin.css" type="text/css" />
<script>
$(function(){
	$("#price1").click(function(){
		$("#price1").val("");
	});
	
	$("#pack_num").click(function(){
		$("#pack_num").val("");
	});
	
	$(document).on('change','#selectRoomType',function(){
		getRoomNameAjax();
	});
	
	$("#packAddFrm").submit(function(){
		if($("#pack_name").val()==""){
			alert("패키지 이름을 입력하세요.");
			return false;
		}
		if($("#price1").val()=="" || $("#price1").val()==0){
			alert("패키지 가격을 입력하세요.");
			return false;
		}
		if($("#pack_num").val()=="" || $("#pack_num").val()==0){
			alert("패키지 개수를 입력하세요.");
			return false;
		}
		if($("#pack_dsp").val()==""){
			alert("메인 설명을 입력하세요.");
			return false;
		}
		var mainImg = $("#packMainImg").attr("src");
		var noImg ="/crown/img/no-img.jpg";
		
		if($("#packMainImg").val()==="undefined" || mainImg==noImg){
			alert("대표이미지를 등록하세요.");
			return false;
		}
	});
	
	$("#pack_start").click(function(){
		$("#datepicker").dateRangePicker(
			{
				autoClose: false,
				format: 'YYYY-MM-DD',
				separator: ' to ',
				language: 'custom',
				startOfWeek: 'sunday',// or monday
				getValue: function()
				{
					return $(this).val();
				},
				setValue: function(s)
				{
					if(!$(this).attr('readonly') && !$(this).is(':disabled') && s != $(this).val())
					{
						$(this).val(s);
					}
				},
				startDate: false,
				endDate: false,
				time: {
					enabled: false
				},
				minDays: 0,
				maxDays: 0,
				showShortcuts: false,
				shortcuts:
				{
					//'prev-days': [1,3,5,7],
					//'next-days': [3,5,7],
					//'prev' : ['week','month','year'],
					//'next' : ['week','month','year']
				},
				customShortcuts:[],
				inline:true,
				container:'#datepicker',
				alwaysOpen:true,
				singleDate:false,
				lookBehind: false,
				batchMode: false,
				duration: 200,
				stickyMonths: false,
				dayDivAttrs: [],
				dayTdAttrs: [],
				applyBtnClass: '',
				singleMonth: 'auto',
				showTopbar: false,
				swapTime: false,
				selectForward: false,
				selectBackward: false,
				showWeekNumbers: false,
				getWeekNumber: function(date) //date will be the first day of a week
				{
					return moment(date).format('w');
				},
				monthSelect: false,
				yearSelect: false,
				selectForward: true,
				startDate: new Date(),
				showDateFilter: function(time, date)
				{
					return '<div style="padding:0 10px; margin-top:10px">\<span style="font-size:16px">'+date+'</span>\</div>';
				},
				separator : ' ~ ',
				getValue: function()
				{
					
				},
				setValue: function(s,s1,s2)
				{
					$('#pack_start').val(s1);
					$('#pack_end').val(s2);
				}	
		});
	});
	
	$("#packMainImgInp").change(function(){
		readImgURL(this);
	});
	
	getRoomNameAjax();
});

function readImgURL(input){

   var url = input.value;
   var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
   if(input.files && input.files[0] &&
   (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")){
      var reader = new FileReader();
      $("#packMainImg").empty();
      reader.onload = function(e){
         $("#packMainImg").attr("src", e.target.result);
      }
      
      reader.readAsDataURL(input.files[0]);
   }
}

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
</script>	
	<div class="admin_content_wrap" id="admin_content_wrap">
		<form method="post" id="packAddFrm" action="<%=ctx%>/adminPackAddOk" enctype="multipart/form-data">
		<div class="admin_content_top">
			<div class="admin_content_title">
				<h2>패키지 등록 페이지</h2>
				<div class="admin_btn_box">
	  				<input class="admin_btn" type="submit" value="등록"/>
	  				<input class="admin_btn" type="reset" value="Reset"/>
				</div>
			</div>
		</div>	
		<div class="admin_content_box admin_half_w ">
			<div class="admin_content_form">
				<div class="admin_input_frm">
					<div>적용 객실 타입</div> 
					<select name="pack_room_type" id="selectRoomType">
						<option value="스탠다드" selected>스탠다드</option>
		 				<option value="클럽 플로어">클럽 플로어</option>
		 				<option value="스위트">스위트</option>
					</select>
		  		</div>
		  		<hr/>
				<div class="admin_input_frm">
						<div id="room_name">객실 이름</div>
						<select id="selectRoomName" name='room_name'>
							
						</select>
				</div>
		  		<hr/>
				<div class="admin_input_frm">
					<div>패키지 제목</div>
						<input type="text" name="pack_name" id ="pack_name" maxlength="30"/>
				</div>
				<hr/>
				<div class="admin_input_frm">
					<div>패키지 설명</div>
					<br/>
					<textarea name="dsp" class="cont" id="pack_dsp" rows="3" cols="59"></textarea></div>
				<hr/>
				<div>
					<p>&nbsp;&nbsp;패키지 옵션</p>
					<div class="pack_item_option">
						<div><input type="checkbox" id="chkBoxOp1" name="chkBoxOp1" value="SUN-FRI ONLY"> <label for="chkBoxOp1">SUN-FRI ONLY</label></div>
						<div><input type="checkbox" id="chkBoxOp2" name="chkBoxOp2" value="SAT ONLY"> <label for="chkBoxOp2">SAT ONLY</label></div>&nbsp;|&nbsp;
						<div><input type="checkbox" id="chkBoxOp3" name="chkBoxOp3" value="조식"> <label for="chkBoxOp3">조식</label></div>
						<div><input type="checkbox" id="chkBoxOp4" name="chkBoxOp4" value="석식"> <label for="chkBoxOp4">석식</label></div>&nbsp;|&nbsp;
						<div><input type="checkbox" id="chkBoxOp5" name="chkBoxOp5" value="키즈"> <label for="chkBoxOp5">키즈</label></div>
						<div><input type="checkbox" id="chkBoxOp6" name="chkBoxOp6" value="성인"> <label for="chkBoxOp6">성인</label></div>&nbsp;|&nbsp;
						<div><input type="checkbox" id="chkBoxOp7" name="chkBoxOp7" value="시즌"> <label for="chkBoxOp7">시즌</label></div>
					</div>
				</div>
				<hr/>
				<div class="pack_item_dsp">
					<div>패키지 아이템 </div><br/>
					<textarea name="sdsp" class="cont" id="pack1" rows="5" cols="59"></textarea>
				</div>
				<div class="admin_input_frm">
					<div>가격:</div><input type="text" name="pack_price" id ="price1" class="only_num" value="0" style="text-align:right"/>&nbsp;원
				</div>
				<hr/>
				<div class="pack_date">
					<p>&nbsp;&nbsp;패키지 기간</p>
					<input type="text" name="pack_start" id="pack_start" val="" maxlength="20"/> ~ <input type="text" name="pack_end" id="pack_end" value="" maxlength="20"/>
					<div id="datepicker"></div>
				</div>	
				<hr/>
				<div class="admin_input_frm">
					<div>패키지 갯수</div> <input type="text" name="pack_num" id ="pack_num" class="only_num" value="0" style="text-align:right"/>&nbsp;개
				</div>
			</div>
		</div>
		<!-- 이미지  -->
		<div class="admin_content_box admin_half_w ">
			<div class="admin_content_form">
				<div>
					<h4>대표 이미지</h4>
		   			<p>이미지 업로드</p>
		   			<input type="file" id="packMainImgInp" name="filename" accept=".png, .jpeg, .gif, .bmp, .jpg">
				</div>
				<div>
		   			<div class ="admin_img_box">
		    			<img id="packMainImg" alt="메인 이미지" src="" onError="this.src='<%=ctx%>/img/no-img.jpg'"/> 
		      		</div>
		   		</div>	
		   	</div>	
		</div><!-- 이미지  -->		
	</form>
	</div><!-- content -->
</div><!-- admin_main_container -->
</section>

