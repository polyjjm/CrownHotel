<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(function(){
	
	CKEDITOR.replace('room_sdsp',{
		filebrowserUploadUrl : '<%=ctx%>/imageUpload'
	});
	
	$(".admin_sub_img_box").css('display','none');
	$("#roomTypeFrm").submit(function(){
		if($("#room_name").val()==""){
			alert("객실이름을 입력하세요.");
			return false;
		}
		if($("#price").val()=="" || $("#price").val()==0){
			alert("객실가격을 입력하세요.");
			return false;
		}
		if($("#room_area").val()=="" || $("#room_area").val()==0){
			alert("객실 크기를 입력하세요.");
			return false;
		}
		if($("#room_mdsp").val()==""){
			alert("메인설명을 입력하세요.");
			return false;
		}
		var mainImg = $("#roomTypeMainImg").attr("src");
		var noImg ="/crown/img/no-img.jpg";
		
		console.log("mainImg = " + mainImg);
		
		if($("#roomTypeMainImg").val()==="undefined" || mainImg==noImg){
			
			alert("대표이미지를 등록하세요.");
			return false;
		}
	});
});
</script>
	
		<!-- content -->
		<div class="admin_content_wrap">
			<form method="post" id="roomTypeFrm" action="<%=ctx%>/adminRoomTypeAddOk" enctype="multipart/form-data">
			<div class="admin_content_top">
				<div class="admin_content_title">
					<h2>객실 타입 등록 페이지</h2>
					<div class="admin_btn_box">
		  				<input class="admin_btn" type="submit" value="등록"/>
		  				<input class="admin_btn" type="reset" value="Reset"/>
	   				</div>
				</div>
			</div>
			
			
			<div class="admin_content_box admin_half_w ">
				
					<div class="admin_content_form">
						<div class="admin_input_frm">
							<div>객실타입 </div> 
							<select name="room_type">
		 						<option value="스탠다드" selected>스탠다드</option>
		 						<option value="클럽 플로어">클럽 플로어</option>
		 						<option value="스위트">스위트</option>
			  				</select>
		  				</div>
		  				<hr/>
						<div class="admin_input_frm">
							<div>객실타입 이름</div>
							<input type="text" name="room_name" id ="room_name" maxlength="20" class="only_char limit_char_ctn"/>
						</div>
						<hr/>
						<div class="admin_input_frm">
							<div>객실가격</div>
							<input type="text" name="str_room_price" id ="price" class="only_num" value="0" style="text-align:right"/>&nbsp;원
						</div>
						<hr/>
						<div class="admin_input_frm">
							<div>객실 크기</div>
							<input type="text" name="room_area" id="room_area" value="0" maxlength="20" class="limit_char_ctn" style="text-align:right"/>&nbsp;㎡
						</div>
						<hr/>
						<div class="admin_input_frm">
							<div>메인설명</div>
							<br/>
							<textarea name="room_mdsp" class="cont" id="room_mdsp" rows="3" cols="60"></textarea></div>
						<hr/>
						<div class="admin_input_frm">
							<div>부가설명</div>
							<br/>
							<textarea name="room_sdsp" id="room_sdsp" ></textarea>
						</div>
					</div>
				</div>
				
				<!-- 이미지  -->
				<div class="admin_content_box admin_half_w ">
					<div class="admin_content_form">
					
						<div>
		   					<h4>대표 이미지</h4>
		   					<p>이미지 업로드</p>
		   					<input type="file" id="roomTypeMainImgInp" name="inpRoomTypeName0" accept=".png, .jpeg, .gif, .bmp, .jpg"/>
						</div>
						<div>
		   					<div class ="admin_img_box">
		      	 				<img id="roomTypeMainImg" alt="메인 이미지" src="" onError="this.src='<%=ctx%>/img/no-img.jpg'" /> 
		      				</div>
		   				</div>
		   				
		   				<hr/>
		   				
		   				<div class="admin_sub_img_title">
		      				<h4>추가 이미지</h4>
		      				<div>
		      					<p>이미지 업로드(최대 6개)</p>
			      				<div class="admin_plus_minus_box">
				      				<span class="admin_plus" onclick="addRoomTypeSubImage()"><img alt="추가" src="<%=ctx%>/img/plus_btn.png"></span>
				      				<span class="admin_minus" onclick="delRoomTypeSubImg()"><img alt="삭제" src="<%=ctx%>/img/minus_btn.png" ></span>
			      				</div>
		      				</div>
		      				
		   				</div>
		   				<div class="admin_sub_img_warp">
		   					<!-- 추가 이미지 폼  -->
		   					<div class="admin_sub_img_box">
			   					<div class="admin_sub_img">
			   						<img id="adminRoomTypeSubImg01" alt="추가 이미지" src="" onError="this.src='img/no-img.jpg'"/>
								</div>
								<input type="file" name="inpRoomTypeName1" id="roomTypeSubImgInp01" class="room_type_sub_img_inp" accept=".png, .jpeg, .gif, .bmp, .jpg"/>
							</div>
							
							<div class="admin_sub_img_box">
			   					<div class="admin_sub_img">
			   						<img id="adminRoomTypeSubImg02" alt="추가 이미지" src="" onError="this.src='img/no-img.jpg'"/>
								</div>
								<input type="file" name="inpRoomTypeName2" id="roomTypeSubImgInp02" class="room_type_sub_img_inp" accept=".png, .jpeg, .gif, .bmp, .jpg"/>
							</div>
							
							<div class="admin_sub_img_box">
			   					<div class="admin_sub_img">
			   						<img id="adminRoomTypeSubImg03" alt="추가 이미지" src="" onError="this.src='img/no-img.jpg'"/>
								</div>
								<input type="file" name="inpRoomTypeName3" id="roomTypeSubImgInp03" class="room_type_sub_img_inp" accept=".png, .jpeg, .gif, .bmp, .jpg"/>
							</div>
							
							<div class="admin_sub_img_box">
			   					<div class="admin_sub_img">
			   						<img id="adminRoomTypeSubImg04" alt="추가 이미지" src="" onError="this.src='img/no-img.jpg'"/>
								</div>
								<input type="file" name="inpRoomTypeName4" id="roomTypeSubImgInp04" class="room_type_sub_img_inp" accept=".png, .jpeg, .gif, .bmp, .jpg"/>
							</div>
							
							<div class="admin_sub_img_box">
			   					<div class="admin_sub_img">
			   						<img id="adminRoomTypeSubImg05" alt="추가 이미지" src="" onError="this.src='img/no-img.jpg'"/>
								</div>
								<input type="file" name="inpRoomTypeName5" id="roomTypeSubImgInp05" class="room_type_sub_img_inp" accept=".png, .jpeg, .gif, .bmp, .jpg"/>
							</div>
							
							<div class="admin_sub_img_box">
			   					<div class="admin_sub_img">
			   						<img id="adminRoomTypeSubImg06" alt="추가 이미지" src="" onError="this.src='img/no-img.jpg'"/>
								</div>
								<input type="file" name="inpRoomTypeName6" id="roomTypeSubImgInp06" class="room_type_sub_img_inp" accept=".png, .jpeg, .gif, .bmp, .jpg"/>
							</div>
		   					
		   				</div><!-- admin_sub_img_warp -->
		   		  				
	
					</div>
				</div><!-- 이미지  -->
				
				
				<!-- 옵션 선택 -->
				<div class="admin_content_box admin_half_w ">		
						<div class="admin_content_form">
							<p>일반 용품</p>
							<div class="room_type_option">
								<div><input type="checkbox" id="chkBoxGen_01" name="chkBoxGen_01" value="40”LED TV" checked> <label for="chkBoxGen_01">40”LED TV</label></div>
								<div><input type="checkbox" id="chkBoxGen_02" name="chkBoxGen_02" value="슬리퍼" checked> <label for="chkBoxGen_02">슬리퍼</label></div>
								<div><input type="checkbox" id="chkBoxGen_03" name="chkBoxGen_03" value="손전등" checked> <label for="chkBoxGen_03">손전등</label></div>
								<div><input type="checkbox" id="chkBoxGen_04" name="chkBoxGen_04" value="전화기" checked> <label for="chkBoxGen_04">전화기</label></div>
								<div><input type="checkbox" id="chkBoxGen_05" name="chkBoxGen_05" value="티포트" checked> <label for="chkBoxGen_05">티포트</label></div>
								<div><input type="checkbox" id="chkBoxGen_06" name="chkBoxGen_06" value="금고" checked> <label for="chkBoxGen_06">금고</label></div>
								<div><input type="checkbox" id="chkBoxGen_07" name="chkBoxGen_07" value="구둣주걱" checked> <label for="chkBoxGen_07">구둣주걱</label></div>
								<div><input type="checkbox" id="chkBoxGen_08" name="chkBoxGen_08" value="구두클리너" checked> <label for="chkBoxGen_08">구두클리너</label></div>
								<div><input type="checkbox" id="chkBoxGen_09" name="chkBoxGen_09" value="미니바" checked> <label for="chkBoxGen_09">미니바</label></div>
								<div><input type="checkbox" id="chkBoxGen_10" name="chkBoxGen_10" value="55”LCD TV" checked> <label for="chkBoxGen_10">55”LCD TV</label></div>
								<div><input type="checkbox" id="chkBoxGen_11" name="chkBoxGen_11" value="빔프로젝터" checked> <label for="chkBoxGen_11">빔프로젝터</label></div>
								<div><input type="checkbox" id="chkBoxGen_12" name="chkBoxGen_12" value="55”UHD TV" checked> <label for="chkBoxGen_12">55”UHD TV</label></div>
							</div>
						</div>
						
						<div class="admin_content_form">	
							<p>욕실 용품</p>
							<div class="room_type_option">
								<div><input type="checkbox" id="chkBoxBath_01" name="chkBoxBath_01" value="1회용 칫솔 및 치약" checked> <label for="chkBoxBath_01">1회용 칫솔 및 치약</label></div>
								<div><input type="checkbox" id="chkBoxBath_02" name="chkBoxBath_02" value="면도기" checked> <label for="chkBoxBath_02">면도기</label></div>
								<div><input type="checkbox" id="chkBoxBath_03" name="chkBoxBath_03" value="목욕가운" checked> <label for="chkBoxBath_03">목욕가운</label></div>
								<div><input type="checkbox" id="chkBoxBath_04" name="chkBoxBath_04" value="비데" checked> <label for="chkBoxBath_04">비데</label></div>
								<div><input type="checkbox" id="chkBoxBath_05" name="chkBoxBath_05" value="헤어드라이어" checked> <label for="chkBoxBath_05">헤어드라이어</label></div>
								<div><input type="checkbox" id="chkBoxBath_06" name="chkBoxBath_06" value="욕실용품" checked> <label for="chkBoxBath_06">욕실용품</label></div>
								<div><input type="checkbox" id="chkBoxBath_07" name="chkBoxBath_07" value="(몰튼브라운)" checked> <label for="chkBoxBath_07">(몰튼브라운)</label></div>
								<div><input type="checkbox" id="chkBoxBath_08" name="chkBoxBath_08" value="월풀(자쿠지)" checked> <label for="chkBoxBath_08">월풀(자쿠지)</label></div>
								<div><input type="checkbox" id="chkBoxBath_09" name="chkBoxBath_09" value="욕실용품(몰트브라운)" checked> <label for="chkBoxBath_09">욕실용품(몰트브라운)</label></div>
							</div>
						</div>
						<div class="admin_content_form">
							<p>기타 용품</p>
							<div class="room_type_option">
								<div><input type="checkbox" id="chkBoxEtc_01" name="chkBoxEtc_01" value="전용 엘레베이터 운영" checked> <label for="chkBoxEtc_01">전용 엘레베이터 운영</label></div>
								<div><input type="checkbox" id="chkBoxEtc_02" name="chkBoxEtc_02" value="케이블/위성 TV 채널" checked> <label for="chkBoxEtc_02">케이블/위성 TV 채널</label></div>
								<div><input type="checkbox" id="chkBoxEtc_03" name="chkBoxEtc_03" value="무료 생수 1일2병" checked> <label for="chkBoxEtc_03">무료 생수 1일2병</label></div>
								<div><input type="checkbox" id="chkBoxEtc_04" name="chkBoxEtc_04" value="보이스 메일 서비스" checked> <label for="chkBoxEtc_04">보이스 메일 서비스</label></div>
								<div><input type="checkbox" id="chkBoxEtc_05" name="chkBoxEtc_05" value="무료차(TEA) 서비스" checked> <label for="chkBoxEtc_05">무료차(TEA) 서비스</label></div>
								<div><input type="checkbox" id="chkBoxEtc_06" name="chkBoxEtc_06" value="네스프레소 커피머신" checked> <label for="chkBoxEtc_06">네스프레소 커피머신</label></div>
								<div><input type="checkbox" id="chkBoxEtc_07" name="chkBoxEtc_07" value="개인 버틀러 서비스" checked> <label for="chkBoxEtc_07">개인 버틀러 서비스</label></div>
							</div>
						</div>
					</div>	<!-- 옵션 선택 -->
				
				
				
			</form>
		</div><!-- content -->
	</div><!-- admin_main_container -->

</section>

