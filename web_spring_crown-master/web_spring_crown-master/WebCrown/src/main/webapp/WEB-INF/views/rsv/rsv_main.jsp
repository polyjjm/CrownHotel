<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<script>
$(function(){
		var adult=1;
		var adult1=0;
		var adult2=0;
		var child=0;
		var child1=0;
		var child2=0;
		var room_num=1;
		var cnt = 0;
	
		$('#rsv_cal3').dateRangePicker(
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
				customShortcuts : [],
				inline:true,
				container:'#rsv_cal3',
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
				showTopbar: true,
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
					return '<div style="padding:0 10px;margin-top:10px">\
								<span style="font-size:30px">'+date+'</span>\
							</div>';
				},
				separator : ' ~ ',
				getValue: function()
				{
					if ($('#rsv_cal').val() && $('#rsv_cal2').val() )
						return $('#rsv_cal').val() + ' ~ ' + $('#rsv_cal2').val();
					else
						return '';
				},
				setValue: function(s,s1,s2)
				{
					var date1 = new Date(s1); 
					var date2 = new Date(s2);
					var s3= ((date2.getTime() - date1.getTime()) / 1000 / 24 / 60 / 60) + 1;

					$('#rsv_check_in').val(s1.replace(/-/g,""));
					$('#rsv_check_out').val(s2.replace(/-/g,""));
					$("#rsv_check").html(s1+"~"+s2+"&nbsp("+s3+")"+'박');
					$("#rsv_next_btn").css("display","block");
				}
			
		});
	


		$("#add_room").on('click',function(){
			cnt++;
			room_num++;
			
			if(room_num==2){
				adult1 ++;
			}
			if(room_num==3){
				adult2 ++;
			}
			
			
			if(room_num==3){
				$("#add_room").css("display","none");
			}
			if(room_num==4){
				alert("객실은 3개까지 예약가능합니다.");
				
				room_num--;
				
				return false;
				
				
			}
			var room = 	$(this).parent().children("ul").children("li:nth-child(1)").clone(true);
			//var rr =$(".d110-room__list").clone(true);
			room.find("#adult").html("성인 "+1);
			room.find("#child").html("어린이 "+0);
			room.find(".num").html(room_num);
			room.find("#rsv_delete").css("display","block")
			room.find("#adult").attr("id","adult"+cnt);
			room.find("#child").attr("id","child"+cnt);
			var total = $("#rsv_info li:nth-child(3)>span:nth-child(2)").clone(true);
			total.html("객실"+room_num+" 성인 1명 어린이 0명<br/>");
			$(".room_cnt").append(room);
			$("#rsv_info li:nth-child(3)").append(total);
			
			
		});

		$("#rsv_delete").on('click',function(){
			cnt--;
			room_num--;
			if(room_num<=3){
				$("#add_room").css("display","block");
			}if(room_num==2){
				$(".room_cnt").children("li:nth-child(3)").children("div").children("span:nth-child(2)").html(room_num);
				$("#rsv_info li:nth-child(3) span:nth-child(4)").html("객실"+room_num+" 성인 "+adult1+"명 "+"어린이 "+child1+"명<br/>");
				
			}
			$("#rsv_info li:nth-child(3) span:nth-child(3)").remove();
			var room= $(this).parent().parent().remove();
			
			
			
			
			
			
			
			
		});
		
		$("#rsv_adult_minus").on('click',function(){
			if($(this).parent().parent().children("p").attr("id")=="adult"){
				adult--;
				if(adult+child<0){
					
					adult++;
					return false;
				
			}
				if(adult ==0){
					adult++;
					return false;
				}
				$("#rsv_info li:nth-child(3) span:nth-child(2)").html("객실1"+" 성인 "+adult+"명 "+"어린이 "+child+"명<br/>");
				$(this).parent().parent().children("p").html("성인 "+adult);
			}else if($(this).parent().parent().children("p").attr("id")=="adult1"){
				adult1--;
				if(adult1+child1<0){
					
					adult1++;
					return false;
				
			}
				if(adult1 ==0){
					adult1++;
					return false;
				}
				$("#rsv_info li:nth-child(3) span:nth-child(3)").html("객실2"+" 성인 "+adult1+"명 "+"어린이 "+child1+"명<br/>");
				$(this).parent().parent().children("p").html("성인 "+adult1);
			}else if($(this).parent().parent().children("p").attr("id")=="adult2"){
				adult2--;
				if(adult2+child2<0){
					
					adult2++;
					return false;
				
			}
				if(adult2 ==0){
				adult2++;
				return false;
				}	
				$("#rsv_info li:nth-child(3) span:nth-child(4)").html("객실3"+" 성인 "+adult2+"명 "+"어린이 "+child2+"명<br/>");
				$(this).parent().parent().children("p").html("성인 "+adult2);
			}
		
		});
		
		$("#rsv_adult_plus").on('click',function(){
			console.log($(this).parent().parent().children("p").attr("id"));
			//$(this).parent().parent().children("p").attr('data-columns',+1);
			if($(this).parent().parent().children("p").attr("id")=="adult"){
				adult++;
				if(adult+child==4){
						alert("인원은 최대 3명까지가능합니다");
						adult--;
						return false;
					
				}
				$("#rsv_info li:nth-child(3) span:nth-child(2)").html("객실1"+" 성인 "+adult+"명 "+"어린이 "+child+"명<br/>");
				$(this).parent().parent().children("p").html("성인 "+adult);
			}else if($(this).parent().parent().children("p").attr("id")=="adult1"){
				adult1++;
				if(adult1+child1==4){
					alert("인원은 최대 3명까지가능합니다");
					adult1--;
					return false;
				
			}
				
				$("#rsv_info li:nth-child(3) span:nth-child(3)").html("객실2"+" 성인 "+adult1+"명 "+"어린이 "+child1+"명<br/>");
				$(this).parent().parent().children("p").html("성인 "+adult1);
			}else if($(this).parent().parent().children("p").attr("id")=="adult2"){
				adult2++;
				if(adult2+child2==4){
					alert("인원은 최대 3명까지가능합니다");
					adult2--;
					return false;
				
			}
				$("#rsv_info li:nth-child(3) span:nth-child(4)").html("객실3"+" 성인 "+adult2+"명 "+"어린이 "+child2+"명<br/>");
				$(this).parent().parent().children("p").html("성인 "+adult2);
			}
			
			});
		
		$("#rsv_child_minus").on('click',function(){
			if($(this).parent().parent().children("p").attr("id")=="child"){
				child--;
					if(adult+child<0){
					
					child++;
					return false;
				
			}
					if(child == -1){
						child++;
						return false;
					}
					$("#rsv_info li:nth-child(3) span:nth-child(2)").html("객실1"+" 성인 "+adult+"명 "+"어린이 "+child+"명<br/>");	
				$(this).parent().parent().children("p").html("어린이 "+child);
			}else if($(this).parent().parent().children("p").attr("id")=="child1"){
				child1--;
		if(adult1+child1<0){
					
					child1++;
					return false;
				
			}
		if(child1 == -1){
			child1++;
			return false;
		}
		
				$("#rsv_info li:nth-child(3) span:nth-child(3)").html("객실2"+" 성인 "+adult1+"명 "+"어린이 "+child1+"명<br/>");
				$(this).parent().parent().children("p").html("어린이 "+child1);
			}else if($(this).parent().parent().children("p").attr("id")=="child2"){
				child2--;
		if(adult2+child2<0){
					
					child2++;
					return false;
				
			}
		if(child2 == -1){
			child2++;
			return false;
		}
		
				$("#rsv_info li:nth-child(3) span:nth-child(4)").html("객실3"+" 성인 "+adult2+"명 "+"어린이 "+child2+"명<br/>");
				$(this).parent().parent().children("p").html("어린이 "+child2);
			}
		
		});
		
		$("#rsv_child_plus").on('click',function(){
			console.log($(this).parent().parent().children("p").attr("id"));
			//$(this).parent().parent().children("p").attr('data-columns',+1);
			if($(this).parent().parent().children("p").attr("id")=="child"){
				child++;
				if(adult+child==4){
					alert("인원은 최대 3명까지가능합니다");
					child--;
					return false;
				
			}
				
				$("#rsv_info li:nth-child(3) span:nth-child(2)").html("객실1"+" 성인 "+adult+"명 "+"어린이 "+child+"명<br/>");
				$(this).parent().parent().children("p").html("어린이 "+child);
			}else if($(this).parent().parent().children("p").attr("id")=="child1"){
				child1++;
				if(adult1+child1==4){
					alert("인원은 최대 3명까지가능합니다");
					child1--;
					return false;
				
			}	
				$("#rsv_info li:nth-child(3) span:nth-child(3)").html("객실2"+" 성인 "+adult1+"명 "+"어린이 "+child1+"명<br/>");
				$(this).parent().parent().children("p").html("어린이 "+child1);
			}else if($(this).parent().parent().children("p").attr("id")=="child2"){
				child2++;
				if(adult2+child2==4){
					alert("인원은 최대 3명까지가능합니다");
					child2--;
					return false;
				
			}
				$("#rsv_info li:nth-child(3) span:nth-child(4)").html("객실3"+" 성인 "+adult2+"명 "+"어린이 "+child2+"명<br/>");
				$(this).parent().parent().children("p").html("어린이 "+child2);
			}
			
			});
			
		
		
			$("#rsv_next_btn").on('click',function(){
				$("#rsv_adult").val(adult);
				$("#rsv_child").val(child);
				$("#rsv_adult1").val(adult1);
				$("#rsv_child1").val(child1);
				$("#rsv_adult2").val(adult2);
				$("#rsv_child2").val(child2);
				
				$("#rsv_room_count").val(room_num);
			});



});



</script>

<section>
<span>홈  / 예약하기</span>

<div id= "resBackground">
	<div id="rsv_main">
			
			<div id="rsv_title"><h1>일정체크 & 객실인원</h1></div>
			<div id="rsv_cal3"></div>
			<div id="rsv_Attendanceofguests">
					<span>객실 -투숙인원</span><span>선택가능 객실 3개 어린이 만3~12세</span>
				<div id="main_form">
					<ul class="room_cnt">
                                        <li class="add_room_list">
                                            <div class="rsv_room">
                                                <span class="txt">객실</span>
                                                <span class="num">1</span>
                                            </div>
                                            
                                              
                                                    <div class="form_count">
                                                        <div class="c-counter">
                                                  	<span>
                                                  	<a href="#" onclick="return false;" id="rsv_adult_minus">
													<img src="/crown/img/minus_btn.png" class="btn_m"/>
													</a>
													</span>
													
                                                           <p class="adult" id="adult">성인 1</p>
                                                    <span>
													<a href="#" onclick="return false;" id="rsv_adult_plus">
													<img src="/crown/img/plus_btn.png" class="btn_m"/>
													</a>
													</span>
                                                        </div>
                                                    </div>
                                                
                                                
                                                    <div class="form_count">
                                                        <div class="c-counter" >
                                                           <span>
                                                  	<a href="#" onclick="return false;" id="rsv_child_minus">
													<img src="/crown/img/minus_btn.png" class="btn_m"/>
													</a>
														   </span>
														   <input type="hidden" value="0"/>
                                                            <p class="child" id="child">어린이 0</p>
                                                           <span>
													<a href="#" onclick="return false;" id="rsv_child_plus">
													<img src="/crown/img/plus_btn.png" class="btn_m"/>
													</a>
													</span>
                                                        </div>
                                                    </div>
                                                   
                                                    
                                                   
                                                     <span>
                                                <a href="#" onclick="return false;" id="rsv_delete">
                                                    <span><img src="/crown/img/close_btn.png"> </span>
                                               </a>
                                               </span>
                                          		
                                               
                                            
                                           
                                              </li>    
                                    </ul>
                                    <br/>
                                 
                                    <button id="add_room" value="">객실 추가 </button>
				</div>		
			
			
			 </div>
			
			<div id="rsv_info">
				<img src="/crown/img/main_img.jpg"/>
				<ul>
					<li>CROWN호텔</li>
					<li>
						<span>체크인-체크아웃<br/></span>
						<span id="rsv_check">기간을 선택해주세요</span>
					
					</li>
					<li>
						객실체크인인원<br/>
						<span class="total">객실1 성인 1명 어린이 0명 <br/></span>
					</li>
					<li>   <form method="get" action="/crown/room_selection">
									<input type="hidden" id="rsv_check_in" name="rsv_check_in" value=""/>
									<input type="hidden" id="rsv_check_out" name="rsv_check_out"value=""/>
									<input type="hidden" id="rsv_adult" name="rsv_adult"value=""/>
									<input type="hidden" id="rsv_child" name="rsv_child"value=""/>
									<input type="hidden" id="rsv_adult1" name="rsv_adult1"value=""/>
									<input type="hidden" id="rsv_child1" name="rsv_child1"value=""/>
									<input type="hidden" id="rsv_adult2" name="rsv_adult2"value=""/>
									<input type="hidden" id="rsv_child2" name="rsv_child2"value=""/>
									<input type="hidden" id="rsv_room_count" name="rsv_room_count" value=""/>
									<input type="submit" id="rsv_next_btn" value="객실&요금확인"/>
						  
						   </form>
					</li>
					
				</ul>
				<div><img src="/crown/img/p.jpg"> 포인트적립을받으세요</div>
			</div>
	</div>
	






</div>


</section>
