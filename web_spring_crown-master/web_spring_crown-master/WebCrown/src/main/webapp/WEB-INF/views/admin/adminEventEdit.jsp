<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=ctx %>/css/admin.css" type="text/css" />
<script>
$(function(){	
	$("#eventAddFrm").submit(function(){
		if($("#event_name").val()==""){
			alert("이벤트 제목을 입력하세요.");
			return false;
		}
		if($("#event_mdsp").val()==""){
			alert("이벤트 내용을 입력하세요.");
			return false;
		}
		var mainImg = $("#eventMainImg").attr("src");
		var noImg ="/crown/img/no-img.jpg";
		
		if($("#eventMainImg").val()==="undefined" || mainImg==noImg){
			alert("대표 이미지를 등록하세요.");
			return false;
		}
	});
	
	$("#event_start").click(function(){
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
					$('#event_start').val(s1);
					$('#event_end').val(s2);
				}	
		});
	});
	
	$("#eventMainImgInp").change(function(){
		readImgURL(this);
	});
});

function readImgURL(input){

   var url = input.value;
   var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
   if(input.files && input.files[0] &&
   (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")){
      var reader = new FileReader();
      $("#eventMainImg").empty();
      reader.onload = function(e){
         $("#eventMainImg").attr("src", e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
   }
}
</script>	
	<div class="admin_content_wrap" id="admin_content_wrap">
		<form method="post" id="eventAddFrm" action="<%=ctx%>/adminEventEditOk" enctype="multipart/form-data">
		<div class="admin_content_top">
			<div class="admin_content_title">
				<h2>이벤트 등록 페이지</h2>
				<div class="admin_btn_box">
					<input class="admin_btn" type="submit" value="수정"/>
					<input class="admin_btn" type="reset" value="Reset"/>
				</div>
			</div>
		</div>	
		<div class="admin_content_box admin_half_w ">
			<div class="admin_content_form">
				<div class="admin_input_frm">
					<input type="hidden" name="event_code" value="${aevo.event_code}"/>
					<div>이벤트 제목</div>
					<input type="text" name="event_name" id ="event_name" maxlength="30" value="${aevo.event_name}"/>
				</div>
				<hr/>
				<div class="admin_input_frm">
					<div>이벤트 내용</div>
					<br/>
					<textarea name="event_mdsp" class="cont" id="event_mdsp" rows="10" cols="59">${replaceEMDSP}</textarea>
				</div>
				<hr/>
				<div class="pack_item_dsp">
					<div>상세 내용</div><br/>
					<textarea name="event_sdsp" class="cont" id="event_sdsp" rows="15" cols="59">${replaceESDSP}</textarea>
				</div>
				<hr/>
				<div class="pack_date">
					<p>&nbsp;&nbsp;이벤트 기간</p>
					<input type="text" name="event_start" id="event_start" value="${aevo.event_start}" maxlength="20"/> ~ <input type="text" name="event_end" id="event_end" value="${aevo.event_end}" maxlength="20"/>
					<div id="datepicker"></div>
				</div>	
			</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
		</div>
		<div class="admin_content_box admin_half_w ">
			<div class="admin_content_form">
				<div>
					<h4>대표 이미지</h4>
		   			<p>이미지 업로드</p>
		   			<input type="file" id="eventMainImgInp" name="filename" accept=".png, .jpeg, .gif, .bmp, .jpg">
				</div>
				<div>
		   			<div class ="admin_img_box">
		    			<img id="eventMainImg" alt="메인 이미지" src="upload/${aevo.img}" onError="this.src='<%=ctx%>/img/no-img.jpg'"/> 
		      		</div>
		   		</div>	
		   	</div>	
		</div>	
		</form>
	</div>
</div>
</section>