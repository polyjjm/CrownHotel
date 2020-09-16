
$.fn.serializeObject = function()
{
   var o = {};
   var a = this.serializeArray();

   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || null);
       } else {
           o[this.name] = this.value || null;
       }
   });

   return o;
};


$(function(){
	
	

	$(".modalLink").on("click",function(){
		$(this).closest("li").find(".modal").fadeIn(300);
		$(this).closest("li").find(".modal-con").fadeIn(300);
		$(this).closest("li").find(".etc").text($(this).closest("li").find(".etc").text().replace(/%!/g,"/").replace(/null/g,""));
		//$(".etc").text($(".etc").text().replace(/%!/g,""));
		$(this).closest("li").find(".bath").text($(this).closest("li").find(".bath").text().replace(/%!/g,"/").replace(/null/g,""));
		$(this).closest("li").find(".general").text($(this).closest("li").find(".general").text().replace(/%!/g,"/").replace(/null/g,""));

		
	});
	$(".modalLinkpack").on("click",function(){
		$(this).closest(".modal").fadeIn(300);
		$(this).find(".modal-con").fadeIn(300);
		$(this).find(".etc").text($(this).closest("li").find(".etc").text().replace(/%!/g,"/"));
		//$(".etc").text($(".etc").text().replace(/%!/g,""));
		$(this).find(".bath").text($(this).closest("li").find(".bath").text().replace(/%!/g,"/"));
		$(this).find(".general").text($(this).closest("li").find(".general").text().replace(/%!/g,"/"));

		
	});

  


	$(".modal, .close").on('click',function(){
  	$(".modal").fadeOut(300);
  	$(".modal-con").fadeOut(300);
	});
	var chk_in = $("#chk_in").val();
	var chk_out = $("#chk_out").val();
	var room_ct = $("#room_ct").val();
	var orderIndex = 0;
   	var count=0;
	var price ="";
	var min = 0 ;
	var max = 0;
	var flag= 0;
	var bk_count=0;
	var packCode=0;
	var pack_price1=0;
	var all_price ="";
		var commission ="";
		var ex_price ="";
		var point= "";
	var selectOrder = 0;
	function room_check(){
	
		$.ajax({
			type:"get",
			url:"/crown/room_detail",
			data:{room_type_code,chk_in,chk_out,room_ct},

			
			success:function(result){
				console.log(result);
				if(result.length ==room_ct){
				for(var i=0;i<result.length;i++){
					console.log(result[i]);
					
					if(i==0){
						$('input[name=room1]').attr('value',result[0]);
						room1 = result[0];
						
					}else if(i==1){
						$('input[name=room2]').attr('value',result[1]);
						room2 = result[1];
					}else if(i==2){
						$('input[name=room3]').attr('value',result[2]);
						room3 = result[2];
					}
				
					
					
					
	               };
	              
				}else if(result.length !=room_ct){
					alert("사용가능한 객실이 없습니다");
					$(".rsv_rate>button").html("요금보기").css("background","#AD9E87");
					$(".rsv_room_deatil").css("display","none");
					$(".rsv_rate>button").parent().parent().parent().css('height',"250px");
					$(".rsv_rate>button").parent().parent().parent().children('div:nth-child(5)').css("display",'none');
					$(".rsv_room_accordion_list").css("display","none");
					return false;

				}

			},beforeSend:function(){


		        $('.wrap-loading').removeClass('display-none');

		    } ,complete:function(){


		        $('.wrap-loading').addClass('display-none');




				
				
		    },error:function(e){
				console.log(e.responseText);
			}
		    ,timeout:100000
		    
		});
	}
	function sprayItem(){
		
		
		 //console.log(orderIndex + "eee");
		 if(selectOrder == 1){
		$.ajax({
			
			type:"get",
			url:"/crown/sprayItem",
			data:{room_type_code,chk_in,chk_out,room_ct,orderIndex,room_ct,selectOrder},
			//contentType : "application/json; charset=UTF-8",


			
			success:function(result){
				if(result!=0){
					var $result= $(result);
			
					
					
						
				
					
					 $('.slider').html('<div class="owl-carousel"></div>');
					 		
					 $result.each(function(idx,data){
						
						 		if(orderIndex == 0 ){
						 		
						 			for(i=0;i<data.RoomData.length;i++){
								 	 	$(".owl-carousel").append('<div class="item"><span>[CROWN HOTEL] 일반요금</span><br/><br/><span><CROWN HOTEL> 리워즈  회원 최대3%적립<span/><br/><img src="upload/'+data.RoomData[i].img+'" onError="this.src=\'img/no-img.jpg\'" style="width:280px;height:150px;""><br/><span>KRW '+data.RoomData[i].room_price+'</span><span>원<span><input type="hidden" class="pack_code" value='+0+' /></div>');	 	
								 	}
								
								 	for(d=0;d<data.packData.length;d++){
								 		 $(".owl-carousel").append('<div class="item"><span>[패키지]'+data.packData[d].pack_name+'<span><br/><br/><span><CROWN HOTEL> 리워즈  회원 최대3%적립<span/><img src="upload/'+data.packData[d].img+'"onError="this.src=\'img/no-img.jpg\'" style="width:280px;height:150px;""><br/><span>KRW'+data.packData[d].pack_price+'</span><span>원</span><input type="hidden" class="pack_code" value='+data.packData[d].pack_code+' /></div>');	 	

								 	
								 	}

						 		}else if(orderIndex == 1){
						 			

								 	for(d=0;d<data.packData.length;d++){
								 		 $(".owl-carousel").append('<div class="item"><span>[패키지]'+data.packData[d].pack_name+'<span><br/><br/><span><CROWN HOTEL> 리워즈  회원 최대3%적립<span/><img src="upload/'+data.packData[d].img+'" onError="this.src=\'img/no-img.jpg\'" style="width:280px;height:150px;""><br/><span>KRW'+data.packData[d].pack_price+'</span><span>원</span><input type="hidden" class="pack_code" value='+data.packData[d].pack_code+' /></div>');	 	

								 	
								 	}
						 			
						 			
						 			for(i=0;i<data.RoomData.length;i++){
						 				$(".owl-carousel").append('<div class="item"><span>[CROWN HOTEL] 일반요금</span><br/><br/><span><CROWN HOTEL> 리워즈  회원 최대3%적립<span/><br/><img src="upload/'+data.RoomData[i].img+'" onError="this.src=\'img/no-img.jpg\'" style="width:280px;height:150px;""><br/><span>KRW '+data.RoomData[i].room_price+'</span><span>원<span><input type="hidden" class="pack_code" value='+0+' /></div>');	 		
								 	}
								

						 			
						 		
						 	
						 	$('.owl-gallery').owlCarousel('refresh');
					 }

					 });

				  var owl = $(".owl-carousel");
	               owl.owlCarousel({
	            	   items :3,
	            	   mouseDrag : false,
	            	   dots: false
	               });
				}else {
					console.log("index 가 0입니다");
					$('.owl-gallery').owlCarousel('refresh');							
				}

		},beforeSend:function(){


	        $('.wrap-loading').removeClass('display-none');

	    } ,complete:function(){


	        $('.wrap-loading').addClass('display-none');




			
			
	    },error:function(e){
			//console.log(e.responseText);
		}
	    ,timeout:100000
	});
		 }
		 if(selectOrder == 0){

			 // var packCodeHidden = $(this).parent().parent().parent().children("input").val();
			// console.log(packCodeHidden + "eeeeeeerwtlerhtkje");
			 

			 $.ajax({
					
					type:"get",
					url:"/crown/sprayItem",
					data:{chk_in,chk_out,room_ct,orderIndex,room_ct,packCode,selectOrder},
					contentType : "application/json; charset=UTF-8",


					
					success:function(result){
						if(result!=0){
							var $result= $(result);
					
							
							
								
						
							
							$('.sliderpack').html('<div class="owl-carouselpack"></div>');
							 		
							 $result.each(function(idx,data){
								 if(data.RoomData.length==0) {
										alert("사용가능한 객실이 없습니다");
										$(".rsv_rate>button").html("요금보기").css("background","#AD9E87");
										$(".rsv_rate>button").parent().parent().parent().css('height',"250px");
										$(".rsv_rate>button").parent().parent().parent().children('div:nth-child(5)').css("display",'none');
										$(".rsv_room_deatil").css("display","none");
										$(".rsv_room_accordion_list").css("display","none");
										$('.owl-gallery').owlCarousel('refresh');
										return false;
										
										
									}
								 			room_type_code= $(this)
								 		if(orderIndex == 0 ){
								 		
								 			
								 			for(i=0;i<data.RoomData.length;i++){
										 	 	$(".owl-carouselpack").append('<div class="item"><span>[CROWN HOTEL] 일반요금</span><br/><br/><br/><br/><span><CROWN HOTEL> 리워즈  회원 최대3%적립<span/><br/><br/><img src="upload/'+data.RoomData[i].img+'" onError="this.src=\'img/no-img.jpg\'" style="width:280px;height:150px;""><span>KRW '+pack_price1+'</span><span>원<span><input type="hidden" class="roomTypeCode" value='+data.RoomData[i].room_type_code+' /></div>');	 	
										 	 	
								 			}
										
								 		}else if(orderIndex == 1){
								 			


								 			
								 			
								 			for(i=0;i<data.RoomData.length;i++){
										 	 	$(".owl-carouselpack").append('<div class="item"><span>[CROWN HOTEL] 일반요금</span><br/><br/><br/><br/><span><CROWN HOTEL> 리워즈  회원 최대3%적립<span/><br/><br/><img src="upload/'+data.RoomData[i].img+'"onError="this.src=\'img/no-img.jpg\'" style="width:280px;height:150px;""><span>KRW '+pack_price1+'</span><span>원<span><input type="hidden" class="pack_code" value='+data.RoomData[i].room_type_code+' /></div>');	 	
										 	}

								 		console.log("eee");
								 	
								 	$('.owl-gallery').owlCarousel('refresh');
								 	
							 }
								 					
							 });

						  var owl = $(".owl-carouselpack");
			               owl.owlCarousel({
			            	   items :3,
			            	   mouseDrag : false,
			            	   dots: false
			               });
			              
						} 

				},beforeSend:function(){


			        $('.wrap-loading').removeClass('display-none');

			    } ,complete:function(){


			        $('.wrap-loading').addClass('display-none');




					
					
			    },error:function(e){
					console.log(e.responseText);
				}
			    ,timeout:100000
			});
			 
			 
		 }
		

		
		
		
		
	}
	function pack_sp(){
		//console.log(orderIndex + "eee");
		if(selectOrder == 1){
			//var url = "/crown/room_list";
		}
		if(selectOrder == 0){
			//var url ="/crown/pack_list";
		}
		
		var params = {room_type_code
				,chk_in
				,chk_out
				,room_ct
				,selectOrder};
		
		
		


	}
	
	var tag="";

	var pack_code="";
	var room_type_code="";

	var all_price = "";
	var commission= "";
	var room1="";
	var room2="";
	var room3="";
	var ex_price ="";
	var point ="";

		$('.rsv_rate>button').on('click',function() {
			if($(this).html()=="닫기"){
				$(".owl-carousel div").remove();
				$(".owl-carouselpack div").remove();
			
			$(this).html("요금보기").css("background","#AD9E87");
			$(this).parent().parent().parent().css('height',"250px");
			$(this).parent().parent().parent().children('div:nth-child(5)').css("display",'none');
			$(this).parent().parent().parent().children('div:nth-child(6)').css("display",'none');
			
			$(".rsv_room_deatil").css("display","none");
			}else if($(this).html()=="요금보기"){
				$(".owl-carousel div").remove();
				$(".owl-carouselpack div").remove();
				room_type_code = $(this).parent().parent().parent().children("div:nth-child(1)").children("input").val();
				packCode = $(this).parent().parent().parent().children("input").val();
				if(selectOrder == 1){
					room_check();
					
				}
				console.log( $(this).parent().closest("li").find(".rsv_room_price").children("span:nth-child(2)").html());
				pack_price1= $(this).parent().closest("li").find(".rsv_room_price").children("span:nth-child(2)").html();
				sprayItem();
				
					
				
			
				
				$(".rsv_rate>button").html("요금보기").css("background","#AD9E87");
				$(".rsv_rate>button").parent().parent().parent().css('height',"250px");
				$(".rsv_rate>button").parent().parent().parent().children('div:nth-child(5)').css("display",'none');
				$(".rsv_rate>button").parent().parent().parent().children('div:nth-child(6)').css("display",'none');

				
				$(this).html("닫기").css("background","black");
				$(this).parent().parent().parent().css('height',"900px");
				$(this).parent().parent().parent().children('div:nth-child(5)').css("display",'block');


			
			
			}
				
			
			});
		
		   $(".rsv_next").click(function() {
		        $(".owl-carousel").trigger('next.owl.carousel');
		    });

		    $(".rsv_prev").click(function() {
		    	 $(".owl-carousel").trigger('prev.owl.carousel');
		    });

		
		
		

		   
		   
		$(document).on("click",".item",function(){  			
			
			$(".rsv_room_detail_info div:nth-child(2)").html("");
			$(".rsv_room_detail_info>div:nth-last-child(n+2)>span:nth-child(4)").html("");
			var check_in_date = $("#chk_in").val().slice(0, 4) + ',' + $("#chk_in").val().slice(4, 6) + ',' + $("#chk_in").val().slice(6,8);
			var check_out_date = $("#chk_out").val().slice(0, 4) + ',' + $("#chk_out").val().slice(4, 6) + ',' + ($("#chk_out").val().slice(6,8) -1);
			
			var startDate = new Date(check_in_date);
			var endDate = new Date(check_out_date);
			var res_day = [];
		 	var ss_day = new Date(startDate);
		   	var ee_day = new Date(endDate);
		   	pack_code=0;

			var room_count = $("#room_count").val();
			while(ss_day.getTime() <= ee_day.getTime()){
	  			var _mon_ = (ss_day.getMonth()+1);
	  			_mon_ = _mon_ < 10 ? '0'+_mon_ : _mon_;
	  			var _day_ = ss_day.getDate();
	  			_day_ = _day_ < 10 ? '0'+_day_ : _day_;
	   			res_day.push(ss_day.getFullYear() + '-' + _mon_ + '-' +  _day_);
	   			ss_day.setDate(ss_day.getDate() + 1);
	   	}

			if (selectOrder == 1){
				
			
			pack_code= $(this).find("input").val();
			
			}
			if(selectOrder == 0){
				room_type_code = $(this).find("input").val();
				room_check();
			}
			

		

			console.log(pack_code);
			if(pack_code !=0 ||pack_code !="0"){
				bk_count = 0;
				$(".rsv_dsp").css("display",'block');
		 		$(".rsv_room_Breakfast").css("display","none");
		 		$(".rsv_room_detail_info>div:last-child()").css("display",'none');
		 	}
			if(pack_code == 0 || pack_code =="0"){
				bk_count = 0;
				$(".rsv_dsp").css("display",'none');
		 		$(".rsv_room_Breakfast").css("display","block");
		 		$(".rsv_room_detail_info>div:last-child()").css("display","block");
		 	}
			
			
			if(selectOrder ==1){
				
		
			$.ajax({
				type:"get",
				url:"/crown/pack_sparead",
				data:{pack_code,room_type_code},
				
				success:function(result){
						
					var $result= $(result);
				
						$result.each(function(idx,vo){
						
							if(pack_code!=0){
								$(".rsv_room_deatil>div:nth-child(1) div:nth-child(1)>span").html(vo.sdsp);
								$(".rsv_room_deatil>div:nth-child(1) div:nth-child(2)>span").html(vo.dsp);
								price = vo.pack_price
								console.log(vo.pack_price);
							}else if(pack_code==0){
								$(".rsv_room_deatil>div:nth-child(1) div:nth-child(1)>span").html(vo.room_name);
								
								price = vo.room_price
								console.log(vo.room_price);
							}
							
					  		for(i=0;i<res_day.length;i++){
					  			// console.log(res_day[i]);
					  			// console.log(new Date(res_day[i]).getDay());
					  			// 주말
					  		
					  			if(new Date(res_day[i]).getDay() ===0 || new Date(res_day[i]).getDay()===6){
					  				$(".rsv_room_detail_info>div:nth-last-child(n+2)>span:nth-child(4)").append(res_day[i]+"&nbsp&nbsp"+(price*1+30000)+"원<br/>");
					  				// console.log(price);
					  				count++;
					  				
					  				// 평일
					  			} else{
					  				$(".rsv_room_detail_info>div:nth-last-child(n+2)>span:nth-child(4)").append(res_day[i]+"&nbsp&nbsp"+price*1+"원<br/>");	
					  				// console.log(price);
					  			}
					  			  
					  	
					  		}
					  	
					  	
				  			all_price = (res_day.length *price) + (count*30000);
				  			commission = ((all_price +(bk_count*30000*res_day.length))/1000)*100 ;
				  			ex_price =(((all_price*1)*room_count)+(bk_count*30000*res_day.length)+commission);
				  			point = ex_price*0.03;
				  			console.log(point);
				  			$(".rsv_room_detail_info div:nth-last-child(n+2) span:nth-child(2)").html(all_price);
				  			$("input[name=Total_price]").attr('value',ex_price);
				  			$(".result_price").html(commission + "원");
				  			$(".ex_price").html("KRW"+ex_price+"원");
						});
						
						$(".bk_minus").on('click',function(){
							min = $(this).closest("div").children("input").attr('min');
							flag = $(this).closest("div").children("input").val();
						
							if(flag*1 > min){
								bk_count--;
								$(this).closest("div").children("input").val(($(this).closest("div").children("input").val())*1-1);
							
							
							
							}
							
							all_price = (res_day.length *price) + (count*30000);
				  			commission = ((all_price +(bk_count*30000*res_day.length))/1000)*100 ;
				  			ex_price =(((all_price*1)*room_count)+(bk_count*30000*res_day.length)+commission);
				  			point = ex_price*0.03;
				  			console.log(point);
				  			$(".result_price").html(commission+"원");
				  			$(".ex_price").html("KRW"+ex_price+"원");
				  			$("input[name=Total_price]").attr('value',ex_price);
				  			$(".rsv_room_detail_info div:last-child() >span:nth-child(3)").html(bk_count+"X1");
				  			$(".rsv_room_detail_info div:last-child() >span:nth-child(4)").html(bk_count*30000*res_day.length+"원");
						});
					
						$(".bk_plus").on('click',function(){
							max = $(this).closest("div").children("input").attr('max');
							flag = $(this).closest("div").children("input").val();

							if(flag*1 < max*1){
								bk_count++;
								$(this).closest("div").children("input").val(($(this).closest("div").children("input").val())*1+1);	
									
							}
							
							all_price = (res_day.length *price) + (count*30000);
				  			commission = ((all_price +(bk_count*30000*res_day.length))/1000)*100 ;
				  			ex_price =(((all_price*1)*room_count)+(bk_count*30000*res_day.length)+commission);
				  			point = ex_price*0.03;
				  			console.log(point);
				  			$(".result_price").html(commission+"원");
				  			$("input[name=Total_price]").attr('value',ex_price);
				  			$(".ex_price").html("KRW"+(((all_price*1)*room_count)+(bk_count*30000*res_day.length)+commission)+"원");
				  			$(".rsv_room_detail_info>div:last-child() >span:nth-child(3)").html(bk_count+"X1");
				  			$(".rsv_room_detail_info>div:last-child() >span:nth-child(4)").html(bk_count*30000*res_day.length+"원");
							
						});

				},beforeSend:function(){


			        $('.wrap-loading').removeClass('display-none');

			    } ,complete:function(){


			        $('.wrap-loading').addClass('display-none');




					
					
			    },error:function(e){
					console.log(e.responseText);
				}
			    ,timeout:100000
			});
	  		
			}
			/////////////////////////////////////////////////////
			else if(selectOrder == 0){
				$(".rsv_dsppack").css("display",'block');
				var pack_price = $(this).closest("li").find(".rsv_room_price").children("span:nth-child(2)").html();
						console.log( $(this).closest("li").find(".rsv_room_price").children("span:nth-child(2)").html());
						price = $(this).closest("li").find(".rsv_room_price").children("span:nth-child(2)").html();
						$(".rsv_room_detail_info_pack>div:nth-last-child(n+2)>span:nth-child(4)").html("");		
						  		for(i=0;i<res_day.length;i++){
						  			// console.log(res_day[i]);
						  			// console.log(new Date(res_day[i]).getDay());
						  			// 주말
						  		
						  			if(new Date(res_day[i]).getDay() ===0 || new Date(res_day[i]).getDay()===6){
						  				$(".rsv_room_detail_info_pack>div:nth-last-child(n+2)>span:nth-child(4)").append(res_day[i]+"&nbsp&nbsp"+(price*1+30000)+"원<br/>");
						  				// console.log(price);
						  				count++;
						  				
						  				// 평일
						  			} else{
						  				$(".rsv_room_detail_info_pack>div:nth-last-child(n+2)>span:nth-child(4)").append(res_day[i]+"&nbsp&nbsp"+price*1+"원<br/>");	
						  				// console.log(price);
						  			}
						  			  
						  	
						  		}
						  	
						  	
					  			all_price = (res_day.length *price) + (count*30000);
					  			commission = ((all_price +(bk_count*30000*res_day.length))/1000)*100 ;
					  			ex_price =(((all_price*1)*room_count)+(bk_count*30000*res_day.length)+commission);
					  			point = ex_price*0.03;
					  			console.log(point);
					  			$(".rsv_room_detail_info_pack div:nth-last-child(n+2) span:nth-child(2)").html(all_price);
					  			$(".rsv_room_detail_info_pack div:nth-last-child(n+2) span:nth-child(2)").css("margin-left","50px");
					  			$("input[name=Total_price]").attr('value',ex_price);
					  			$(".result_price").html(commission + "원");
					  			$(".ex_price").html("KRW"+ex_price+"원");
							};

			
			
			
			
			
			
			$(this).parent().parent().parent().parent().parent().parent().parent().css("height","2500px");
			$(this).parent().parent().parent().parent().parent().parent().parent().children("div:nth-child(6)").css("display","block");
		});




		$(document).on('click','.mem_Rsv , .guest_Rsv',function() {
			
			$("input[name=Total_room1]").attr('value',room1);
			$("input[name=Total_room2]").attr('value',room2);
			$("input[name=Total_room3]").attr('value',room3);
			if(selectOrder==1){
			$("input[name=Total_pack_code]").attr('value',pack_code);
			}
			if(selectOrder==0){
				$("input[name=Total_pack_code]").attr('value',packCode);	
			}
			$("input[name=Total_requests1]").attr('value',$(".additional_request1").val());
			$("input[name=Total_requests2]").attr('value',$(".additional_request2").val());
			$("input[name=Total_requests3]").attr('value',$(".additional_request3").val());
			$("input[name=Total_bk1]").attr('value',$(".bk").first().val());
			$("input[name=Total_bk2]").attr('value',$(".bk").eq(0).val());
			$("input[name=Total_bk3]").attr('value',$(".bk").last().val());
			$("input[name=Total_point]").attr('value',point);
		
			if(selectOrder == 1){
				$("input[name=Total_room_price]").attr('value',$(".rsv_room_detail_info>div:nth-child(1) span:nth-child(2)").html().replace(/원/g,""));	
			}
			if(selectOrder ==0){
				$("input[name=Total_room_price]").attr('value',$(".rsv_room_detail_info_pack>div:nth-child(1) span:nth-child(2)").html().replace(/원/g,""));
			}
			
			
			
			$("input[name=Total_bk_price]").attr('value',$(".rsv_room_detail_info>div:last-child() >span:nth-child(4)").html().replace(/원/g,""));


		});

		// ///////////////////////////////////////////////////////////////////////////////////////////////////
		
/*
$(".pay").on('click',function(){
	$("input[name=guestName]").attr('value',$("#guest_first_name").val() + $("#guest_last_name").val());
	$("input[name=guestEmail]").attr('value',$("#guest_email").val());
	$("input[name=guestTel]").attr('value',$("#tel1").val()+"-"+$("#tel2").val()+"-"+$("#tel3").val());
		var IMP = window.IMP; // 생략가능
		IMP.init('imp81940054'); 
		IMP.request_pay({
		    pg : 'kakaopay', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '방예약:결제테스트',
		    amount : 100,
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    
		}, function(rsp) {
		    if ( rsp.success ) {
		    	var params = $("#payForm").serializeObject();
		    	 params.imp_uid = rsp.imp_uid;
		    	 var url = "/crown/pay";
		    	$.ajax({
		    		url : url,
		    		data :JSON.stringify(params),
		    		type : "POST",
		    		contentType: 'application/json; charset=UTF-8', 
		    		success:function(result){
		    				if(result>0){
		    					console.log("wqe");
		    				}
		    		}
		    	}).done(function(rsp) {
		    		// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;

		    			alert(msg);
		    		} else {
		    			// [3] 아직 제대로 결제가 되지 않았습니다.
		    			// [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});   
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;

			    alert(msg);
		    }

		});
		
});	

*/









		var usePoint ="";
$(".pay").on('click',function(){
	
		if (!$("input:checked[Name='chk1']").is(":checked")){ alert("취소규정 확인을 체크해주세요."); $("#chk1").focus(); return; }
		if (!$("input:checked[Name='chk2']").is(":checked")){ alert("개인정보수집에 동의해주세요."); $("#chk2").focus(); return; }
		if($("input[name='guest_first_name']").val()==null ||$("input[name='guest_first_name']").val()=="" ){alert("이름을입력해주세요.");return false}
		if($("input[name='guest_last_name']").val()==null || $("input[name='guest_last_name']").val()==""){alert("이름을입력해주세요.");return false}
		//if($("select[Name='tel1']").val()==null){alert("전화번호를 확인해주세요.");return false}
		if($("input[name='tel2']").val()==null ||$("input[name='tel2']").val()==""){alert("전화번호를 확인해주세요.");return false}
		if($("input[name='tel3']").val()==null ||$("input[name='tel3']").val()==""){alert("전화번호를 확인해주세요.");return false}
		if($("input[name='guest_email']").val()==null || $("input[name='guest_email']").val()==""){alert("이메일을입력해주세요");return false}
							
	if($("input[name= usePointInput]").val() != null){
		usePoint = $("input[name= usePointInput]").val().replace(/,/g,"");
		console.log(usePoint);
	}
	
	
	$("input[name=guestName]").attr('value',$("#guest_first_name").val() + $("#guest_last_name").val());
	$("input[name=guestEmail]").attr('value',$("#guest_email").val());
	$("input[name=guestTel]").attr('value',$("#tel1").val()+"-"+$("#tel2").val()+"-"+$("#tel3").val());
	if(usePoint * 1 >=1000){
		$("input[name=usePoint]").attr('value',usePoint);	
	} if(usePoint*1 >=1 && usePoint * 1 <1000 ){
		alert("마일리지는 1000원이상 사용가능합니다");
		return false;

	}

	var params = $("#payForm").serializeObject();

  	var url = "/crown/pay";
	var IMP = window.IMP; // 생략가능
	IMP.init('imp81940054'); 
	IMP.request_pay({
		
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 100,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
		params.imp_uid = rsp.imp_uid;
		console.log(params);
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
      


   	$.ajax({
   		url : url,
   		data :JSON.stringify(params),
   		type : "POST",
   		contentType: 'application/json; charset=UTF-8', 
   		success:function(result){
   				if(result != null){
   					console.log("결제성공");
   					console.log(result + " 결제 아이디");
   				}
   				location.href="chkNumber?uid="+result;

   		}
   	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }

    alert(msg);
});

});
























$(".rsv_price_order").on('click',function(){
	orderIndex = $(this).index();
	sprayItem();
});



$(".mem_Rsv2").on('click',function(){
	
	alert("로그인을 먼저해주세요");
	location.href ='/crown/loginForm';
	
	
});
$(".order_select").on('click',function(){
	
	selectOrder = $(this).index();
	console.log(selectOrder);
	if(selectOrder == 0){
		$(".rsv_room_choice").first().css("display","none");
		$(".rsv_room_choice").last().css("display","block");
	}
	if(selectOrder == 1){
		$(".rsv_room_choice").first().css("display","block");
		$(".rsv_room_choice").last().css("display","none");
	}

	
	
});










});