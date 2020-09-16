//loginMain 전체 체크박스 선택
$(function(){ 
	//전체선택 체크박스 클릭 
	$("#allCheck").change("checked",function(){
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#allCheck").prop("checked")) { 
			//해당화면에 동의 radio들을 체크해준다 
			$(".loginMain_true").prop("checked",true);
			
			// 전체선택 체크박스가 해제된 경우
		}else{ 
			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
			$("input[type=radio]").prop("checked",false);
		} 
	});
		
});
//loginMain 미동의 했을시 전체동의 체크박스 해제 
$(function(){
	$(".loginMain_false").change("checked",function(){
		if($("#loginMainFalse1").prop("checked")){
			$("#allCheck").prop("checked",false);
		
		}else if($("#loginMainFalse2").prop("checked")){
			$("#allCheck").prop("checked",false);
		}else if($("#loginMainFalse3").prop("checked")){
			$("#allCheck").prop("checked",false);
		}	
	});
});
//loginMain 동의가 다 체크 되어있을시 전체동의 체크박스 체크하기
$(function(){ 
	$(".loginMain_true").change("checked",function(){
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#loginMainTrue1").prop("checked")) {
			
		if($("#loginMainTrue2").prop("checked")){
			//해당화면에 동의 radio들을 체크해준다 
			$("#allCheck").prop("checked",true);
			
			}
		}
	});
		
});



//idCheck
$(function(){
	$("#idSet").click(function(){
		opener.document.getElementById("user_id").value= $("#idSearch").text() ;
		opener.document.getElementById("idStatus").value= "Y";
		self.close();
	});
});