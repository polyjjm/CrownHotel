<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
	$(function(){
		$(".close_room_type_img").parent('div').next('input').css('display','none');
		$(".hidden_sub_img_form").css('display','none');
		$(".exg_sub_img_form").css('display','block');
		
		
	
		CKEDITOR.replace('room_sdsp',{
			filebrowserUploadUrl : '<%=ctx%>/imageUpload'
		});
		
		
	});
	
</script>
			<!-- content -->
			<div class="admin_content_wrap">
			<form method="post" id="roomTypeFrm" action="<%=ctx%>/adminRoomTypeEditOk" enctype="multipart/form-data">
			<div class="admin_content_top">
				<div class="admin_content_title">
					<h2>객실 타입 수정 페이지</h2>
					<div class="admin_btn_box">
		  				<input id="eidtRoomTypeInp" class="admin_btn" type="submit" value="저장"/>
		  				<a href="<%=ctx%>/adminRoomTypeEdit?room_type_code=${vo.room_type_code}" class="admin_btn">되돌리기</a>
	   				</div>
				</div>
			</div>
	
			<div class="admin_content_box admin_half_w ">
				<div class="admin_content_form">
					<div class="admin_input_frm">
						<input type="hidden" name="room_type_code" value="${vo.room_type_code }"/>
						<div>객실타입 수정</div> 
						<select name="room_type">
							<option value="스탠다드" <c:if test="${vo.room_type=='스탠다드'}">selected</c:if>>스탠다드</option>
							<option value="클럽 플로어"<c:if test="${vo.room_type=='클럽 플로어'}">selected</c:if>>클럽 플로어</option>
							<option value="스위트"<c:if test="${vo.room_type=='스위트'}">selected</c:if>>스위트</option>
		  				</select>
					</div>
					<hr/>
					<div class="admin_input_frm">
						<div>객실타입 이름</div>
						<input type="text" name="room_name" id ="room_name" maxlength="20" class="only_char limit_char_ctn" value="${vo.room_name }"/>
					</div>
					<hr/>
					<div class="admin_input_frm">
						<div>객실가격</div>
						<input type="text" name="str_room_price" id ="price" class="only_num" value="${vo.room_price }" style="text-align:right"/>&nbsp;원
					</div>
					<hr/>
					<div class="admin_input_frm">
						<div>객실 크기</div>
						<input type="text" name="room_area" id="room_area" value="${vo.room_area }" maxlength="20" class="limit_char_ctn" style="text-align:right"/>&nbsp;㎡
					</div>
					<hr/>
					<div class="admin_input_frm">
						<div>메인설명</div>
						<br/>
						<textarea name="room_mdsp" class="cont" id="room_mdsp" rows="3" cols="60">${vo.room_mdsp }</textarea></div>
					<hr/>
					<div class="admin_input_frm">
						<div>부가설명</div>
						<br/>
						<textarea name="room_sdsp" id="room_sdsp" rows="5" cols="60">${vo.room_sdsp }</textarea>
					</div>
					<hr/>
					
					<div>
						<p>일반 용품</p>
						<div class="room_type_option">
							<div><input type="checkbox" id="chkBoxGen_01" name="chkBoxGen_01" value="40”LED TV" <c:if test="${vo.chkBoxGen_01=='40”LED TV'}"> checked</c:if>><label for="chkBoxGen_01">40”LED TV</label></div>
							<div><input type="checkbox" id="chkBoxGen_02" name="chkBoxGen_02" value="슬리퍼" <c:if test="${vo.chkBoxGen_02=='슬리퍼'}"> checked</c:if>> <label for="chkBoxGen_02">슬리퍼</label></div>
							<div><input type="checkbox" id="chkBoxGen_03" name="chkBoxGen_03" value="손전등" <c:if test="${vo.chkBoxGen_03=='손전등'}"> checked</c:if>> <label for="chkBoxGen_03">손전등</label></div>
							<div><input type="checkbox" id="chkBoxGen_04" name="chkBoxGen_04" value="전화기" <c:if test="${vo.chkBoxGen_04=='전화기'}"> checked</c:if>> <label for="chkBoxGen_04">전화기</label></div>
							<div><input type="checkbox" id="chkBoxGen_05" name="chkBoxGen_05" value="티포트" <c:if test="${vo.chkBoxGen_05=='티포트'}"> checked</c:if>> <label for="chkBoxGen_05">티포트</label></div>
							<div><input type="checkbox" id="chkBoxGen_06" name="chkBoxGen_06" value="금고" <c:if test="${vo.chkBoxGen_06=='금고'}"> checked</c:if>> <label for="chkBoxGen_06">금고</label></div>
							<div><input type="checkbox" id="chkBoxGen_07" name="chkBoxGen_07" value="구둣주걱" <c:if test="${vo.chkBoxGen_07=='구둣주걱'}"> checked</c:if>> <label for="chkBoxGen_07">구둣주걱</label></div>
							<div><input type="checkbox" id="chkBoxGen_08" name="chkBoxGen_08" value="구두클리너" <c:if test="${vo.chkBoxGen_08=='구두클리너'}"> checked</c:if>> <label for="chkBoxGen_08">구두클리너</label></div>
							<div><input type="checkbox" id="chkBoxGen_09" name="chkBoxGen_09" value="미니바" <c:if test="${vo.chkBoxGen_09=='미니바'}"> checked</c:if>> <label for="chkBoxGen_09">미니바</label></div>
							<div><input type="checkbox" id="chkBoxGen_10" name="chkBoxGen_10" value="55”LCD TV" <c:if test="${vo.chkBoxGen_10=='55”LCD TV'}"> checked</c:if>> <label for="chkBoxGen_10">55”LCD TV</label></div>
							<div><input type="checkbox" id="chkBoxGen_11" name="chkBoxGen_11" value="빔프로젝터" <c:if test="${vo.chkBoxGen_11=='빔프로젝터'}"> checked</c:if>> <label for="chkBoxGen_11">빔프로젝터</label></div>
							<div><input type="checkbox" id="chkBoxGen_12" name="chkBoxGen_12" value="55”UHD TV" <c:if test="${vo.chkBoxGen_12=='55”UHD TV'}"> checked</c:if>> <label for="chkBoxGen_12">55”UHD TV</label></div>
						</div>
						<hr/>
						<p>욕실 용품</p>
						<div class="room_type_option">
							<div><input type="checkbox" id="chkBoxBath_01" name="chkBoxBath_01" value="1회용 칫솔 및 치약" <c:if test="${vo.chkBoxBath_01=='1회용 칫솔 및 치약'}"> checked</c:if>><label for="chkBoxBath_01">1회용 칫솔 및 치약</label></div>
							<div><input type="checkbox" id="chkBoxBath_02" name="chkBoxBath_02" value="면도기" <c:if test="${vo.chkBoxBath_02=='면도기'}"> checked</c:if>> <label for="chkBoxBath_02">면도기</label></div>
							<div><input type="checkbox" id="chkBoxBath_03" name="chkBoxBath_03" value="목욕가운" <c:if test="${vo.chkBoxBath_03=='목욕가운'}"> checked</c:if>> <label for="chkBoxBath_03">목욕가운</label></div>
							<div><input type="checkbox" id="chkBoxBath_04" name="chkBoxBath_04" value="비데" <c:if test="${vo.chkBoxBath_04=='비데'}"> checked</c:if>> <label for="chkBoxBath_04">비데</label></div>
							<div><input type="checkbox" id="chkBoxBath_05" name="chkBoxBath_05" value="헤어드라이어" <c:if test="${vo.chkBoxBath_05=='헤어드라이어'}"> checked</c:if>> <label for="chkBoxBath_05">헤어드라이어</label></div>
							<div><input type="checkbox" id="chkBoxBath_06" name="chkBoxBath_06" value="욕실용품" <c:if test="${vo.chkBoxBath_06=='욕실용품'}"> checked</c:if>> <label for="chkBoxBath_06">욕실용품</label></div>
							<div><input type="checkbox" id="chkBoxBath_07" name="chkBoxBath_07" value="(몰튼브라운)" <c:if test="${vo.chkBoxBath_07=='(몰튼브라운)'}"> checked</c:if>> <label for="chkBoxBath_07">(몰튼브라운)</label></div>
							<div><input type="checkbox" id="chkBoxBath_08" name="chkBoxBath_08" value="월풀(자쿠지)" <c:if test="${vo.chkBoxBath_08=='월풀(자쿠지)'}"> checked</c:if>> <label for="chkBoxBath_08">월풀(자쿠지)</label></div>
							<div><input type="checkbox" id="chkBoxBath_09" name="chkBoxBath_09" value="욕실용품(몰트브라운)" <c:if test="${vo.chkBoxBath_09=='욕실용품(몰트브라운)'}"> checked</c:if>> <label for="chkBoxBath_09">욕실용품(몰트브라운)</label></div>
							
						</div>
						<hr/>
						<p>기타 용품</p>
						<div class="room_type_option">
							<div><input type="checkbox" id="chkBoxEtc_01" name="chkBoxEtc_01" value="전용 엘레베이터 운영" <c:if test="${vo.chkBoxEtc_01=='전용 엘레베이터 운영'}"> checked</c:if>> <label for="chkBoxEtc_01">전용 엘레베이터 운영</label></div>
							<div><input type="checkbox" id="chkBoxEtc_02" name="chkBoxEtc_02" value="케이블/위성 TV 채널" <c:if test="${vo.chkBoxEtc_02=='케이블/위성 TV 채널'}"> checked</c:if>> <label for="chkBoxEtc_02">케이블/위성 TV 채널</label></div>
							<div><input type="checkbox" id="chkBoxEtc_03" name="chkBoxEtc_03" value="무료 생수 1일2병" <c:if test="${vo.chkBoxEtc_03=='무료 생수 1일2병'}"> checked</c:if>> <label for="chkBoxEtc_03">무료 생수 1일2병</label></div>
							<div><input type="checkbox" id="chkBoxEtc_04" name="chkBoxEtc_04" value="보이스 메일 서비스" <c:if test="${vo.chkBoxEtc_04=='보이스 메일 서비스'}"> checked</c:if>> <label for="chkBoxEtc_04">보이스 메일 서비스</label></div>
							<div><input type="checkbox" id="chkBoxEtc_05" name="chkBoxEtc_05" value="무료차(TEA) 서비스" <c:if test="${vo.chkBoxEtc_05=='무료차(TEA) 서비스'}"> checked</c:if>> <label for="chkBoxEtc_05">무료차(TEA) 서비스</label></div>
							<div><input type="checkbox" id="chkBoxEtc_06" name="chkBoxEtc_06" value="네스프레소 커피머신" <c:if test="${vo.chkBoxEtc_06=='네스프레소 커피머신'}"> checked</c:if>> <label for="chkBoxEtc_06">네스프레소 커피머신</label></div>
							<div><input type="checkbox" id="chkBoxEtc_07" name="chkBoxEtc_07" value="개인 버틀러 서비스" <c:if test="${vo.chkBoxEtc_07=='개인 버틀러 서비스'}"> checked</c:if>> <label for="chkBoxEtc_07">개인 버틀러 서비스</label></div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 이미지 -->
			<div class="admin_content_box admin_half_w ">
				<div class="admin_content_form">
				
					<!-- 대표 이미지  -->
					
					
					<c:if test="${vo.roomImgList[0]!=null}">
						<div>
							<h4>대표 이미지</h4>
							<p>이미지 업로드</p>
							<input type="hidden" id="roomTypeMainImgInp01" name="" accept=".png, .jpeg, .gif, .bmp, .jpg">
							<input type="hidden" id="roomTypeMainImgInp02" name="inpRoomTypeName0" value="${vo.roomImgList[0]}" accept=".png, .jpeg, .gif, .bmp, .jpg">
							<input type="hidden" name="" id="delRoomTypeMainImg" value="${vo.roomImgList[0]}"/>
						</div>
						<div>
							<div class ="admin_img_box">
		      	 				<img id="roomTypeMainImg" alt="메인 이미지" src="upload/${vo.roomImgList[0]}" onError="this.src='<%=ctx%>/img/no-img.jpg'"/> 
		      					<div class="close_room_type_img"><i class="xi-close-circle-o xi-x btn_close_room_img" ></i></div>
		      				</div>
						</div>				
					</c:if>
					
					<!-- 추가 이미지 -->					
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
	   					<c:forEach var="sub" items="${vo.roomImgList}" begin="1" varStatus="status">
	   					
	   						<div class="admin_sub_img_box exg_sub_img_form">
	   							<div class="admin_sub_img">
	   								<img alt="추가 이미지" id="adminRoomTypeSubImg0${status.index}" src="upload/${sub}" onError="this.src='img/no-img.jpg'"/>
	   								<div id="adminRoomTypeSubImgDiv${status.index}" class="close_room_type_img"><i class="xi-close-circle-o xi-x btn_close_room_subimg"  onclick="closeRoomSubImg(${status.index});"></i></div>
	   							</div>
	   							<input type="file" name="inpRoomTypeName${status.index}" id="roomTypeSubImgInp0${status.index}" class="room_type_sub_img_inp" accept=".png, .jpeg, .gif, .bmp, .jpg"/>
	   						</div>
	   						<input type="hidden" name="" value="${sub}" id="delRoomTypeSubImg${status.index}"/>
	   					</c:forEach>
	   				
	   					<!-- 숨겨진 추가 이미지 폼 -->
	   					<c:forEach var="index" begin="${fn:length(vo.roomImgList)}" end="6">
		 					<div class="admin_sub_img_box hidden_sub_img_form">
								<div class="admin_sub_img">
									<img id="adminRoomTypeSubImg0${index}" alt="추가 이미지" src="" onError="this.src='img/no-img.jpg'"/>
								</div>
								<input type="file" name="inpRoomTypeName${index}" id="roomTypeSubImgInp0${index}" class="room_type_sub_img_inp" accept=".png, .jpeg, .gif, .bmp, .jpg"/>
							</div>
						</c:forEach>

	   				</div><!-- admin_sub_img_warp -->

				</div>
			</div>
		</form>
	</div>
</section>