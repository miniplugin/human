
var isOver1 = false;
var isOver2 = false;
function goHide1() {
	if (!isOver1 && !isOver2) {
		$('.gnb_depth2_1').stop().fadeOut('fast');
	}
}
var isOver11 = false;
var isOver22 = false;
function goHide2() {
	if (!isOver11 && !isOver22)	{
		$('.gnb_depth2_2').stop().fadeOut('fast');
	}
}
var isOver111 = false;
var isOver222 = false;
function goHide3() {
	if (!isOver111 && !isOver222) {
		$('.gnb_depth2_3').stop().fadeOut('fast');
	}
}
var isOver1111 = false;
var isOver2222 = false;
function goHide4() {
	if (!isOver1111 && !isOver2222) {
		$('.gnb_depth2_4').stop().fadeOut('fast');
	}
}
var isOver11111 = false;
var isOver22222 = false;
function goHide5() {
	if (!isOver11111 && !isOver22222) {
		$('.gnb_depth2_5').stop().fadeOut('fast');
	}
}

$(document).ready( function() {
	$('a.s_point').smoothScroll();

	// 스크롤하여 내려와야 top버튼이 보이도록 함.
	if ( $(document).scrollTop() < 50) $('.to_top').addClass('hide');
	else $('.to_top').removeClass('hide');
	$(window).scroll( function() {
	  if ( $(document).scrollTop() < 50) $('.to_top').addClass('hide');
	  else $('.to_top').removeClass('hide');
	});

	//gnb_depth2_1	
	$('.openAll1').mouseover(function(){
		if ( parseInt($('header').css('width')) > 800 ) $('.gnb_depth2_1').fadeIn('fast');
		isOver1 = true;
	});	
    $('.openAll1').focus(function(){
		if ( parseInt($('header').css('width')) > 800 ) $('.gnb_depth2_1').fadeIn('fast');
		isOver1 = true;
	});
	$('.openAll1').mouseout(function(){
		isOver1 = false;
		setTimeout("goHide1()",200);
	});	
	$('.gnb_depth2_1 li:last-child a').blur(function(){
		isOver1 = false;
		setTimeout("goHide1()",200);
	});	
	$('.gnb_depth2_1').mouseover(function(){
		isOver2 = true;			
	});	
	$('.gnb_depth2_1').focus(function(){
		isOver2 = true;			
	});	
	$('.gnb_depth2_1').mouseout(function(){
		isOver2 = false;
		setTimeout("goHide1()",200);
	});	
	$('.gnb_depth2_1').blur(function(){
		isOver2 = false;
		setTimeout("goHide1()",200);
	});	
	//gnb_depth2_2	
	$('.openAll2').mouseover(function(){
		if ( parseInt($('header').css('width')) > 800 ) $('.gnb_depth2_2').fadeIn('fast');
		isOver11 = true;
	});
	$('.openAll2').focus(function(){
		if ( parseInt($('header').css('width')) > 800 ) $('.gnb_depth2_2').fadeIn('fast');
		isOver11 = true;
	});
	$('.openAll2').mouseout(function(){
		isOver11 = false;
		setTimeout("goHide2()",200);
	});	
	$('.gnb_depth2_2 li:last-child a').blur(function(){
		isOver11 = false;
		setTimeout("goHide2()",200);
	});	
	$('.gnb_depth2_2').mouseover(function(){
		isOver22 = true;			
	});	
	$('.gnb_depth2_2').focus(function(){
		isOver22 = true;			
	});	
	$('.gnb_depth2_2').mouseout(function(){
		isOver22 = false;
		setTimeout("goHide2()",200);
	});	
	$('.gnb_depth2_2').blur(function(){
		isOver22 = false;
		setTimeout("goHide2()",200);
	});	
	//gnb_depth2_3	
	$('.openAll3').mouseover(function(){
		if ( parseInt($('header').css('width')) > 800 ) $('.gnb_depth2_3').fadeIn('fast');
		isOver111 = true;
	});
	$('.openAll3').focus(function(){
		if ( parseInt($('header').css('width')) > 800 ) $('.gnb_depth2_3').fadeIn('fast');
		isOver111 = true;
	});
	$('.openAll3').mouseout(function(){
		isOver111 = false;
		setTimeout("goHide3()",200);
	});	
	$('.gnb_depth2_3 li:last-child a').blur(function(){
		isOver111 = false;
		setTimeout("goHide3()",200);
	});	
	$('.gnb_depth2_3').mouseover(function(){
		isOver222 = true;			
	});	
	$('.gnb_depth2_3').focus(function(){
		isOver222 = true;			
	});	
	$('.gnb_depth2_3').mouseout(function(){
		isOver222 = false;
		setTimeout("goHide3()",200);
	});	
	$('.gnb_depth2_3').blur(function(){
		isOver222 = false;
		setTimeout("goHide3()",200);
	});	
	//gnb_depth2_4	
	$('.openAll4').mouseover(function(){
		if ( parseInt($('header').css('width')) > 800 ) $('.gnb_depth2_4').fadeIn('fast');
		isOver1111 = true;
	});
	$('.openAll4').focus(function(){
		if ( parseInt($('header').css('width')) > 800 ) $('.gnb_depth2_4').fadeIn('fast');
		isOver1111 = true;
	});
	$('.openAll4').mouseout(function(){
		isOver1111 = false;
		setTimeout("goHide4()",200);
	});	
	$('.gnb_depth2_4 li:last-child a').blur(function(){
		isOver1111 = false;
		setTimeout("goHide4()",200);
	});	
	$('.gnb_depth2_4').mouseover(function(){
		isOver2222 = true;			
	});	
	$('.gnb_depth2_4').focus(function(){
		isOver2222 = true;			
	});	
	$('.gnb_depth2_4').mouseout(function(){
		isOver2222 = false;
		setTimeout("goHide4()",200);
	});	
	$('.gnb_depth2_4').blur(function(){
		isOver2222 = false;
		setTimeout("goHide4()",200);
	});	
    
	//모바일 메뉴 띄움
	$('.openMOgnb').click(function(){
		$('header').addClass('on');
		$('header .header_cont').slideDown('fast');
		$('header .header_area .header_cont .closePop').show();			
		$("body").bind('touchmove', function(e){e.preventDefault()});
	});
	$('header .header_cont .closePop').click(function(){
        $('.header_cont').slideUp('fast');
        $('header').removeClass('on');
        $("body").unbind('touchmove');
	});
	
});


$(document).ready(function(){
    // PC브라우저에서 좁혀서 메뉴 닫고 다시 넓힐 때 상단메뉴 노출되게.
    $(window).resize(function() {
        if ( parseInt($('header').css('width')) > 800 ) $('.header_cont').show();
    }); 
    
    // 프로그램 소개 - 더보기/접기 작동
	$('.program_list li .btn_more a').click(function(){
		if ($(this).parent().parent().find('.subtxt').css('display') == 'none') {
			$(this).parent().parent().find('.subtxt').css('display','inline');
			$(this).text('접기');
		} else {
			$(this).parent().parent().find('.subtxt').css('display','none');
			$(this).text('더보기');
		}
	});
   
});
