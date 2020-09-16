$(function(){

	//관리자 메인 매뉴바
	$(".admin_menu_title").click(function(){
		
		$(this).next().slideToggle("300");
		
	});
	
	
	//요금 3자리마다  ,//금액 입력 시 숫자만 표기//포커스가 사라지면 콤마를 추가하여 금액 표기
	$('#price').on('focus',function(){
		var rate = $('#price').val();
		if(!isEmpty(rate)){
			rate = rate.replace(/,/g,'');
			$('#price').val(rate);
		}
	});
	
	$('#price').on('blur',function(){
		var rate = $('#price').val();
		if(!isEmpty(rate) && isNumeric(rate)){
			rate = currencyFormatter(rate);
			$('#price').val(rate);
		}
	});
	
	//숫자만 입력
	$(".only_num").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	// 글자수 제한
	$('.limit_char_ctn').keyup(function(){ 
		if ($(this).val().length > $(this).attr('maxlength')) {
			alert('제한길이 초과(20자)'); 
			$(this).val($(this).val().substr(0, $(this).attr('maxlength'))); 
		} 
	});
	
	//특수문자 제거
	$('.only_char').keyup(function(){
		var str = $(this).val();
		//특수문자 검증 start
	    var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;

	    if(regExp.test(str)){

	        //특수문자 제거
	        var t = str.replace(regExp, "");
	        alert("특수문자는 입력할 수 없습니다.");
	        $(this).val(t);
	    }
	});
	
	var maxSize = 2*1024*1024;
	 //객실타입 메인이미지 미리보기(1개)
     $("#roomTypeMainImgInp").change(function(){
    	 var fileSize = $(this)[0].files[0].size;
    	
    	 if(fileSize > maxSize){
    		 $(this).val("");
    		 alert("첨부파일 사이즈는 2MB 이내로 등록 가능합니다.");
    		 return false;
    	 }
    	 
    	 readImgURL(this);
       
     })

     //객실타입 서브 이미지 미리보기
     $(document).on("change", ".room_type_sub_img_inp", function(){
    	 var fileSize = $(this)[0].files[0].size;
     	
    	 if(fileSize > maxSize){
    		 $(this).val("");
    		 alert("첨부파일 사이즈는 2MB 이내로 등록 가능합니다.");
    		 return false;
    	 }
    	 var getInpId = $(this).attr('id');
    	 console.log("getInpId = "+getInpId);
    	 var no = getInpId.substring(18,19);
    	 console.log("no = "+no);
    	 readSubImgURL(this, no)
     });
   	
     //room_type 기존 메인 이미지 수정 : 이미지 삭제, input변환
     $(document).on('click','.btn_close_room_img',function(){
    	 $(this).parent('div').remove();
    	 $("#roomTypeMainImg").attr("src","");
    	 $("#roomTypeMainImgInp01").attr("type","file");
    	 $("#roomTypeMainImgInp01").attr("name","inpRoomTypeName0");
    	 $("#roomTypeMainImgInp02").attr("name","");
    	 $("#delRoomTypeMainImg").attr("name", "delRoomTypeImgList");
     });
    
     
     
});

//room_type 기존 서브 이미지 수정 : 이미지 삭제, input변환
function closeRoomSubImg(no){

	document.getElementById('roomTypeSubImgInp0'+no+'').style.display = 'block';
	document.getElementById('delRoomTypeSubImg'+no+'').setAttribute('name', 'delRoomTypeImgList' );
	document.getElementById('adminRoomTypeSubImg0'+no+'').setAttribute("src","");
	var delDiv =  document.getElementById('adminRoomTypeSubImgDiv'+no+'');
	delDiv.parentNode.removeChild(delDiv);
}


//서브이미지 input 폼추가
function addRoomTypeSubImage(){
	var isNoneImg01 = document.getElementById("roomTypeSubImgInp01").parentNode;
	var isNoneImg02 = document.getElementById("roomTypeSubImgInp02").parentNode;
	var isNoneImg03 = document.getElementById("roomTypeSubImgInp03").parentNode;
	var isNoneImg04 = document.getElementById("roomTypeSubImgInp04").parentNode;
	var isNoneImg05 = document.getElementById("roomTypeSubImgInp05").parentNode;
	var isNoneImg06 = document.getElementById("roomTypeSubImgInp06").parentNode;
	if(isNoneImg01.style.display=='none'){
		var mainImgId = document.getElementById('roomTypeMainImg');
		var mainImgSrc = mainImgId.getAttribute('src');
		if(mainImgSrc=="/crown/img/no-img.jpg" || mainImgSrc==""){
			alert("메인 이미지를 등록하세요.");
			return false;
		}
		
		isNoneImg01.style.display ='block';
		console.log("서브이미지 1번 : isNoneImg01 "+ isNoneImg01.style.display);
	}else if(isNoneImg02.style.display=='none'){
	
		isNoneImg02.style.display ='block';
	}else if(isNoneImg03.style.display=='none'){
	
		isNoneImg03.style.display='block';
	}else if(isNoneImg04.style.display=='none'){
	
		isNoneImg04.style.display='block';
	}else if(isNoneImg05.style.display=='none'){
	
		isNoneImg05.style.display='block';
	}else if(isNoneImg06.style.display=='none'){
	
		isNoneImg06.style.display='block';
	}else if(isNoneImg06.style.display=='block'){
		alert("이미지는 최대 6개까지 업로드 가능합니다.");
		return false;
	}
}

//서브이미지 input 폼삭제
function delRoomTypeSubImg(){
	var isNoneImg01 = document.getElementById("roomTypeSubImgInp01").parentNode;
	var isNoneImg02 = document.getElementById("roomTypeSubImgInp02").parentNode;
	var isNoneImg03 = document.getElementById("roomTypeSubImgInp03").parentNode;
	var isNoneImg04 = document.getElementById("roomTypeSubImgInp04").parentNode;
	var isNoneImg05 = document.getElementById("roomTypeSubImgInp05").parentNode;
	var isNoneImg06 = document.getElementById("roomTypeSubImgInp06").parentNode;
	
	var closeSubImgBtn1 = document.getElementById('adminRoomTypeSubImgDiv1');
	var closeSubImgBtn2 = document.getElementById('adminRoomTypeSubImgDiv2');
	var closeSubImgBtn3 = document.getElementById('adminRoomTypeSubImgDiv3');
	var closeSubImgBtn4 = document.getElementById('adminRoomTypeSubImgDiv4');
	var closeSubImgBtn5 = document.getElementById('adminRoomTypeSubImgDiv5');
	var closeSubImgBtn6 = document.getElementById('adminRoomTypeSubImgDiv6');

	
	if(closeSubImgBtn6){
		alert("6이미지를 변경하세요.");
		return false;
	}else if(isNoneImg06.style.display=='block'){
		console.log("6번 이미지 div none");
		isNoneImg06.style.display='none';
	}else if(closeSubImgBtn5){
		alert("5이미지를 변경하세요.");
		return false;
	}else if(isNoneImg05.style.display=='block'){
		console.log("5번 이미지 div none");
		isNoneImg05.style.display='none';
	}else if(closeSubImgBtn4){
		alert("4이미지를 변경하세요.");
		return false;
	}else if(isNoneImg04.style.display=='block'){
		console.log("4번 이미지 div none");
		isNoneImg04.style.display='none';
	}
	else if(closeSubImgBtn3){
		alert("3이미지를 변경하세요.");
		return false;
	}else if(isNoneImg03.style.display=='block'){
		console.log("3번 이미지 div none");
		isNoneImg03.style.display='none';
	}
	else if(closeSubImgBtn2){
		alert("2이미지를 변경하세요.");
		return false;
	}else if(isNoneImg02.style.display=='block'){
		console.log("2번 이미지 div none");
		isNoneImg02.style.display='none';
	}
	else if(closeSubImgBtn1){
		alert("1이미지를 변경하세요.");
		return false;
	}else if(isNoneImg01.style.display=='block'){
		console.log("1번 이미지 div none");
		isNoneImg01.style.display='none';
	}

}

//객실타입 메인 이미지 업로드(미리보기 1개)
function readImgURL(input){

   var url = input.value;
   var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
   if(input.files && input.files[0] &&
   (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")){
      var reader = new FileReader();
      $("#roomTypeMainImg").empty();
      reader.onload = function(e){
         $("#roomTypeMainImg").attr("src", e.target.result);
      }
      
      reader.readAsDataURL(input.files[0]);
   }
}

//객실타입 서브 이미지 업로드(미리보기)
function readSubImgURL(input, no){

   var url = input.value;
   var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
   if(input.files && input.files[0] &&
   (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")){
      var reader = new FileReader();
      $("#adminRoomTypeSubImg0"+no+"").empty();
      reader.onload = function(e){
         $("#adminRoomTypeSubImg0"+no+"").attr("src", e.target.result);
      }
      
      reader.readAsDataURL(input.files[0]);
   }
}

/* === 객실타입 등록 정규식 === */
function adminRegExp(str){ 
    //특수문자 검증 start
    var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;

    if(regExp.test(str)){

        //특수문자 제거
        var t = str.replace(regExp, "")
        alert("특수문자를 제거했습니다. ==>" + t)
    }
    //특수문자 검증 end
}

//null check
function isEmpty(value){
	if(value.length == 0 || value==null){
		return true;
	}else{
		return false;
	}
}

// Number check with Regular expression
function isNumeric(value){
	var regExp = /^[0-9]+$/g;
	return regExp.test(value);
}

//숫자 세자리 마다 콤마를 추가하여 금액 표기 형태로 변환
function currencyFormatter(amount){
	return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
}




