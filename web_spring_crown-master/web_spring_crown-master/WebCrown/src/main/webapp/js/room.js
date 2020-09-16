$(document).ready(function(){
	
	/* 메인룸 슬릭스라이더 */
	
	$(".r_slider_box").slick({
		   infinite:true , 
	       slidesToShow:1, 
	       slidesToScroll:1,
	       autoplay:false, 
	       arrows:false,
	       prevArrow:$(".r_slider_left"),
	       nextArrow:$(".r_slider_right"),
	       dots:true, 
	       speed:500 
	});
	
	$(".r_slider_left").click(function(){ 
		$(this).parent().find('.r_slider_box').slick('slickPrev');
	});
	$(".r_slider_right").click(function(){ 
		$(this).parent().find('.r_slider_box').slick('slickNext');
	});
	
	
	/* 룸타입 메인 슬릭슬라이더 */
	$(".r_slide_box").slick({
		   infinite:true , 
	       slidesToShow:1, 
	       slidesToScroll:1,
	       autoplay:false, 
	       arrows:false,
	       prevArrow:$(".r_slider_prev"),
	       nextArrow:$(".r_slider_next"),
	       dots:true, 
	       speed:500
	});
	
	$(".r_slider_prev").click(function(){ 
		$(this).parent().find('.r_slide_box').slick('slickPrev');
		$(this).focus();
	});
	$(".r_slider_next").click(function(){ 
		$(this).parent().find('.r_slide_box').slick('slickNext');
		$(this).focus();
	});
});



