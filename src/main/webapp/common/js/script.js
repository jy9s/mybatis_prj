var isWeb;
var isTabl;
var isMobile;
var imgSwiper;

$(document).ready(function(){
	if(location.href.indexOf("main") > -1){
		if($(window).height() < $(".quickOpen").outerHeight() + parseInt($(".quickArea").css("bottom").split("p")[0]) + 65 ){
			$(".quickOpen").css("height", $(window).height() /2);
		}
	}

	$(window).resize(function(){
		// 퀵메뉴 높이 값 잡기
		if(location.href.indexOf("main") > -1){			
		}

		//반응형
		if(jQuery(window).width() > 1015){ //웹
			isWeb = true;
			isTabl = false;
			isMobile = false;

			if(curMsrch == true){
				$(".mHeader .srchBtn").removeClass("on");
				$(".mSrchArea").stop().slideUp(0);
				curMsrch = false;
			}

			TweenMax.to($(".quickArea"), 1, {right:40, opacity:1, delay:0.5, ease:Power3.easeOut});

			// tab 높이 값 잡기
			heightSizePc();
			
		}else if(741 < jQuery(window).width() && jQuery(window).width() <= 983){ //태블릿
			isWeb = false;
			isTabl = true;
			isMobile = false;

			if(isMgnb == false){
				$(".mMenuArea").css('left', '-100%');
			}

			TweenMax.to($(".quickArea"), 1, {right:'3%', opacity:1, delay:0.5, ease:Power3.easeOut});
			
			// tab 높이 값 잡기
			heightSizePc();
			
		}else if(741 >= jQuery(window).width()){ //모바일
			isWeb = false;
			isTabl = false;
			isMobile = true;

			if(isMgnb == false){
				$(".mMenuArea").css('left', '-100%');
			}

			TweenMax.to($(".quickArea"), 1, {right:'3%', opacity:1, delay:0.5, ease:Power3.easeOut});
			
			// tab 높이 값 잡기
			heightSizeMobile();
			
		}


		// 모바일 화면
		if($('.mMenuArea').css('display') == 'block'){
			if($('.mMenuArea').position().left == 0){
				$("#wrapper").children().not(".mMenuArea").css('height', '0').css('overflow','hidden').css('border-top','none');
			}

			$(".web_mbl_img").each(function(){
				if( $(this).attr('src') != $(this).data().mblImgPath ){
					$(this).attr('src', $(this).data().mblImgPath);
				}
			});

		}else{
			$("#wrapper").children().not(".mMenuArea").css('height', '').css('overflow','').css('border-top','');

			$(".web_mbl_img").each(function(){
				if( $(this).attr('src') != $(this).data().webImgPath ){
					$(this).attr('src', $(this).data().webImgPath);
				}
			});
		}

	});$(window).resize();

	// 셀렉트 길이조정
	var resizeselect = function(){
        $('.resizeselect').each(function(){
			$(this).change(function(){
				var $selectList = $(this);

				if($selectList.val() != "" && $(window).width() > 983){
					var $selectedOption = $selectList.children('[value="' + this.value + '"]').attr('selected', true);
					var selectedIndex = $selectedOption.index();

					var $nonSelectedOptions = $selectList.children().not($selectedOption).remove().attr('selected', false);

					// Reset and calculate new fixed width having only selected option as a child
					$selectList.width('auto').width($selectList.outerWidth());

					// Add options back and put selected option in the right place on the list
					$selectedOption.remove();
					$selectList.append($nonSelectedOptions);
					if (selectedIndex >= $nonSelectedOptions.length) {
						$selectList.append($selectedOption);
					} else {
						$selectList.children().eq(selectedIndex).before($selectedOption);
					}
				}
			});
		});

		$(window).resize(function(){
			if($(window).width() <= 983){
				$('.resizeselect').css('width','');
			}else{
				$('.resizeselect').trigger('change');
			}
		});

	}();

	// 탑버튼
	$(".topBtn").click(function(){
		TweenMax.to($("html, body"), 0.5, {scrollTop:0, ease:Power3.easeOut});
	});

	$(window).scroll(function(){
		if($(".mainPopBan").length < 0){
			if($(window).scrollTop() > 0){
				$("#util").css("margin-bottom", $("#header").outerHeight(true));
				$("#header").css({"position":"fixed"});
			}else{
				$("#util").css("margin-bottom", 0);
				$("#header").css({"position":"relative"});
			}
		}else{
			if($(window).scrollTop() > 150){
				$("#util").css("margin-bottom", $("#header").outerHeight(true));
				$("#header").css({"position":"fixed"});
			}else{
				$("#util").css("margin-bottom", 0);
				$("#header").css({"position":"relative"});
			}
		}

		if($(".mainPopBan").length < 0){
			if($(window).scrollTop() > 0){
				$(".mHeader").css({"position":"fixed"});
			}else{
				$(".mHeader").css({"position":"relative"});
			};
		}else{
			if($(window).scrollTop() > 470){
				if(isWeb == false && isTabl == true && isMobile == false){
					$(".mHeader").css({"position":"fixed"});
				}
			}else if($(window).scrollTop() > 235){
				if(isWeb == false && isTabl == false && isMobile == true){
					$(".mHeader").css({"position":"fixed"});
				}
			}else{
				$(".mHeader").css({"position":"relative"});
			}
		}
		
		if($(window).scrollTop() + $(window).height() >= $("#footer").offset().top){
			$(".topBtn").css({"position":"absolute", "bottom":$("#footer").outerHeight(true)});
			$(".topBtn").fadeIn(500);
			if(isWeb == true && isTabl == false && isMobile == false){
				$(".quickArea").css({"position":"absolute", "bottom":$("#footer").outerHeight(true)+70});
			}else if(isWeb == false && isTabl == true && isMobile == false){
				$(".quickArea").css({"position":"absolute", "bottom":$("#footer").outerHeight(true)+50});
			}else if(isWeb == false && isTabl == false && isMobile == true){
				$(".quickArea").css({"position":"absolute", "bottom":$("#footer").outerHeight(true)+50});
			};

		}else{
			$(".topBtn").css({"position":"fixed", "bottom":0});
			$(".topBtn").fadeOut(500);
			if(isWeb == true && isTabl == false && isMobile == false){
				$(".quickArea").css({"position":"fixed", "bottom":70});
			}else if(isWeb == false && isTabl == true && isMobile == false){
				$(".quickArea").css({"position":"fixed", "bottom":50});
			}else if(isWeb == false && isTabl == false && isMobile == true){
				$(".quickArea").css({"position":"fixed", "bottom":50});
			};
		}
	});

	// 헤더 검색버튼 클릭 시
	var isSrchOn = false;
	$("#header .right .srchBtn a").click(function(){
		if(!$(this).hasClass("on")){
			$(this).addClass("on");
			$(".blackBg").css("z-index",50);
			$(".blackBg").stop().fadeIn(300);
			$("#header .srchArea").stop().slideDown(300);
			$(".quickArea, .topBtn").css("z-index", 49);
			$("#header #gnb > li > a").css({"color":"rgba(0,0,0,0.5)" , "cursor": "default"} );
			isSrchOn = true;
		}else{
			$(this).removeClass("on");
			$("#header .srchArea").stop().slideUp(300);
			$("#header #gnb > li > a").css({"color":"#000" , "cursor": "pointer"});
			$(".blackBg").stop().fadeOut(300, function(){
				$(".quickArea, .topBtn").css("z-index", 70);
				$(".blackBg").css("z-index",100);
				isSrchOn = false;
			});
		}
	});

	$("#header .srchArea .closeBtn").click(function(){
		$("#header .right .srchBtn a").removeClass("on");
		$("#header .srchArea").stop().slideUp(300);
		$("#header #gnb > li > a").css({"color":"#000" , "cursor": "pointer"});
		$(".blackBg").stop().fadeOut(300, function(){
			$(".quickArea, .topBtn").css("z-index", 70);
			$(".blackBg").css("z-index",100);
			isSrchOn = false;
		});
	});

	//모바일 검색 클릭
	var curMsrch = false;
	$(".mHeader .srchBtn").click(function(){
		if(curMsrch == false){
			$(this).addClass("on");
			$(".mSrchArea").stop().slideDown(350);
			curMsrch = true;
		}else if(curMsrch == true){
			$(this).removeClass("on");
			$(".mSrchArea").stop().slideUp(350);
			curMsrch = false;
		}
	});
	
	// GNB
	var gnbNum = -1;
	$("#header #gnb > li").each(function(i){
		$(this).on("mouseenter", function(){
			if(isSrchOn == false){
				if(!$("#header").hasClass("on")){
					$("#header #gnb > li").eq(gnbNum).removeClass("on");
					$("#header #gnb > li").eq(gnbNum).find(".openDiv").hide();
					gnbNum = i;
					$("#header #gnb > li").eq(gnbNum).find(".openDiv").stop().slideDown(300, function(){
						$("#header").addClass("on");
					});
					$("#header #gnb > li").eq(gnbNum).addClass("on");
				}else{
					$("#header #gnb > li").eq(gnbNum).find(".openDiv").hide();
					$("#header #gnb > li").eq(gnbNum).removeClass("on");
					gnbNum = i;
					$("#header #gnb > li").eq(gnbNum).find(".openDiv").show();
					$("#header #gnb > li").eq(gnbNum).addClass("on");
				}
			}
		});
	});

	$("#header #gnb").hover(function(){
		$(".blackBg").css("z-index",50);
		$(".blackBg").fadeIn(300);
		$(".quickArea, .topBtn").css("z-index", 49);
	}, function(){
		if(isSrchOn == false){
			$("#header #gnb > li").find(".openDiv").stop().slideUp(300, function(){
				gnbNum = -1;
				$("#header").removeClass("on");
			});
			$(".blackBg").stop().fadeOut(300, function(){
				$(".blackBg").css("z-index",100);
			});
			$(".quickArea, .topBtn").css("z-index", 70);
			$("#header #gnb > li").removeClass("on");
		}
	});

	//모바일GNB
	var mGnbOne = -1;
	var mGnbTwo = -1;
	$(".mMenuArea .gnbArea .oneD").each(function(q){
		if($(this).hasClass("on"))
		{
			mGnbOne = q;
		}
		$(this).click(function(){
			if(mGnbOne != q){
				$(".mMenuArea .gnbArea .oneD").eq(mGnbOne).removeClass("on");
				$(".mMenuArea .gnbArea .twoD").eq(mGnbOne).stop().slideUp(300);
				mGnbOne = q;
				$(".mMenuArea .gnbArea .oneD").eq(mGnbOne).addClass("on");
				if($(".mMenuArea .gnbArea .twoD").find("a").length > 0)
				{
					$(".mMenuArea .gnbArea .twoD").eq(mGnbOne).stop().slideDown(300);
				}
			}else if(mGnbOne == q){
				$(".mMenuArea .gnbArea .oneD").eq(mGnbOne).removeClass("on");
				$(".mMenuArea .gnbArea .twoD").eq(mGnbOne).stop().slideUp(300);
				mGnbOne = -1;
			}
		});
	});

	$(".mMenuArea .gnbArea .twoD a").each(function(q){
		if($(this).hasClass("on"))
		{
			mGnbTwo = q;
		}
		$(this).click(function(){
			if(mGnbTwo != q){
				$(".mMenuArea .gnbArea .twoD a").eq(mGnbTwo).removeClass("on");
				$(".mMenuArea .gnbArea .twoD .thrD").stop().slideUp(300);
				mGnbTwo = q;
				$(".mMenuArea .gnbArea .twoD a").eq(mGnbTwo).addClass("on");
				if($(".mMenuArea .gnbArea .twoD a").eq(mGnbTwo).next(".thrD").find("a").length > 0)
				{
					$(".mMenuArea .gnbArea .twoD a").eq(mGnbTwo).next(".thrD").stop().slideDown(300);
				}
			}else if(mGnbTwo == q){
				$(".mMenuArea .gnbArea .twoD a").eq(mGnbTwo).removeClass("on");
				$(".mMenuArea .gnbArea .twoD .thrD").stop().slideUp(300);
				mGnbTwo = -1;
			}
		});
	});

	 var isMgnb = false;
        $(".mHeader .menuBtn").click(function(){
			if(isMgnb == false){
				$(".mMenuArea").css('height', '2000px');
				TweenMax.to($(".mMenuArea"), .8, {left:0, ease:Power3.easeOut, onComplete:function(){
					$(".mMenuArea").css('position', 'relative').css('height','');
					$("body, html").scrollTop(0);
					//$("#wrapper").children().not(".mMenuArea").css('display', 'none');
					$("#wrapper").children().not(".mMenuArea").css('height', '0').css('overflow','hidden').css('border-top','none');

					$('.gnbArea a').each(function(){
						var href = $(this).attr('href');

						if(href.indexOf(window.location.pathname) > -1){
								$("body, html").stop().animate({scrollTop:$(this).position().top}, 300, 'swing');
						}
					});
				}});

				isMgnb = true;
			}
        });
	$(".mMenuArea .top .closeBt").click(function(){
		if(isMgnb == true){
			$(".mMenuArea").css('position', 'absolute');
			$("#wrapper").children().not(".mMenuArea").css('height', '').css('overflow','');
			TweenMax.to($(".mMenuArea"), .8, {left:'-100%', ease:Power3.easeOut});

			isMgnb = false;
		}
	});
    $('.burger-icon').click(function(){
        if($('.mHeader').hasClass('on')){
            $('.mHeader').removeClass('on');
        }else{
            $('.mHeader').addClass('on');
        }
    });



	// 영역 밖 클릭 시 이벤트
	$(document).click(function(e){
		if($("#util .container .right .lang").has(e.target).length === 0){
			$("#util .container .right .lang").children("a").removeClass("on");
			$("#util .container .right .lang").children("div").slideUp(200);
		}
		if($(".openSel").has(e.target).length === 0){
			$(".openSel").find(".option").slideUp(200);
		}
		if($(".lnbArea .lnb").has(e.target).length === 0){
			$(".lnbArea .lnb > div > a").removeClass("on");
			$(".lnbArea").find(".moreMenu").slideUp(200);
		}
		if($(".lnbArea .shareArea").has(e.target).length === 0){
			$(".lnbArea .shareArea .share > a.on").removeClass("on");
			$(".lnbArea .shareArea .share > div").slideUp(200);
		}
		if($(".grayPopArea").has(e.target).length === 0){
			$(".grayPopArea > a").removeClass("on");
			$(".grayPopArea").find(".grayPop").hide();
		}
	});

	
	// gnb 배너 롤링
	// if($(".swiper-container.rollArea").find(".swiper-slide").size() > 1)
	// {
	// 	var mainBannerSwiper = new Swiper('.swiper-container.rollArea', {
	// 		slidesPerView: 1,
	// 		speed: 300,
	// 		loop: true,
	// 		autoplay:{
	// 			delay:5000,
	// 		},
	// 		autoHeight:true,
	// 		pagination: {
	// 			el: '.swiper-pagination',
	// 			clickable: true,
	// 		},
	// 		on: {
	// 			init: function () {
	// 			},
	// 			slideChangeTransitionStart: function(){

	// 			},
	// 			slideChangeTransitionEnd: function(){
	// 				//TweenMax.to($(".mainVisArea .swiper-wrapper .swiper-slide").not(".swiper-slide-active").find(".txtBox"), 0, {top:180, opacity:0, ease:Power3.easeOut});
	// 				//TweenMax.to($(".mainVisArea .swiper-wrapper .swiper-slide.swiper-slide-active .txtBox"), 1.5, {top:80, opacity:1, ease:Power3.easeOut});
	// 			},
	// 			imagesReady: function(){
	// 				//TweenMax.fromTo($(".mainVisArea .swiper-wrapper .swiper-slide.swiper-slide-active .txtBox"), 1.5, { top:180, opacity:0 }, { top:80, opacity:1, ease:Power3.easeOut});
	// 			}
	// 		}
	// 	});
	// }

	// 언어버튼 클릭 시
	$("#util .container .right .lang > a").click(function(){
		if(!$(this).hasClass("on")){
			$(this).addClass("on");
			$(this).next().slideDown(300);
		}else{
			$(this).removeClass("on");
			$(this).next().slideUp(300);
		}
	});

	// LNB 클릭 시
	$(".lnbArea .lnb > div > a").click(function(){
		if(!$(this).hasClass("on")){
			$(".lnbArea .lnb > div > a").removeClass("on");
			$(".lnbArea .lnb > div > div").css("z-index", "0").slideUp(300);
			$(this).addClass("on");
			$(this).next().css("z-index", "15").slideDown(300);
		}else{
			$(this).removeClass("on");
			$(this).next().css("z-index", "0").slideUp(300);
		}
	});
	
	// 검색영역 셀렉트 클릭 시
	$(".srchSel > a").click(function(){
		if(!$(this).hasClass("on")){
			$(".srchSel > a").removeClass("on");
			$(".srchSel > div").slideUp(300);
			$(this).addClass("on");
			$(this).next().stop().slideDown(300);
		}else{
			$(this).removeClass("on");
			$(this).next().slideUp(300);
		}
	});
	$(".srchSel > div a").click(function(){
		var selTxt = $(this).text();
		$(this).siblings(".active").removeClass("active");
		$(this).addClass("active");
		$(this).parent().siblings("a").text(selTxt).removeClass("on");
		$(this).parent().slideUp(300);
	});
	$(".srchSel").focusout(function(){
		$(this).children("a").removeClass("on");
		$(this).children("div").delay(100).slideUp(300);
	});


	// 검색영역3 셀렉트 클릭 시
	$(".srchType3 .srchSel > div a").click(function(){
		$(this).parents(".srchSel").children("a").addClass("active");
	});

	// 이미지 롤링
	// if($(".swiper-container.imgRollArea").find(".swiper-slide").size() > 1)
	// {
	// 	imgSwiper = new Swiper('.swiper-container.imgRollArea', {
	// 		slidesPerView: 1,
	// 		speed: 800,
	// 		loop: true,
	// 		autoplay:{
	// 			delay:5000,
	// 		},
	// 		autoHeight:true,
	// 		pagination: {
	// 			el: '.swiper-container.imgRollArea .swiper-pagination',
	// 			clickable: true,
	// 		},
	// 		navigation: {
	// 		nextEl: '.swiper-container.imgRollArea .swiper-button-next',
	// 		prevEl: '.swiper-container.imgRollArea .swiper-button-prev',
	// 		},
	// 		on: {
	// 			init: function () {
	// 			},
	// 		}
	// 	});
	// 	$(".imgRollArea .swiper-pagination").append("<a href='javascript:' class='playBtn'></a>");
	// 	$(".imgRollArea .playBtn").click(function(){
	// 		if(!$(this).hasClass("on")){
	// 			$(this).addClass("on");
	// 			imgSwiper.autoplay.stop();
	// 		}else {
	// 			$(this).removeClass("on");
	// 			imgSwiper.autoplay.start();
	// 		}
	// 	});
	// }
	

	// 레이어팝업 닫기
	var arrChkPop;
	$(".layerPop .popClose").click(function(){
		$(this).parent(".layerPop").stop().fadeOut(300);
		arrChkPop = new Array();

		$(".layerPop").each(function(q){
			if($(".layerPop").eq(q).is(":visible")){
				arrChkPop.push(q);
			}
		});

		/*if(arrChkPop.length == 1) $(".blackBg").stop().fadeOut(300);*/
		if(jQuery(".srchArea").is(":hidden") && jQuery(".quickOpen") .is(":hidden")){
			jQuery(".blackBg").stop().fadeOut(300);
		}else{
			jQuery(".blackBg").css("z-index","50");
		}
		$('body').removeClass("lypopOpen");
	});

	// 팝업 닫기 (확인 버튼)
	$(".layerPop .confirmBtn.close").click(function(){
		$(".blackBg").stop().fadeOut(300);
		$(".layerPop").stop().fadeOut(300);
		$('body').removeClass("lypopOpen");
	});


	// 스크롤
	// if($(".scrollbox").size() != 0){
	// 	$(".scrollbox").mCustomScrollbar({
	// 		scrollInertia:50,
	// 		advanced:{
    //             updateOnContentResize: true
    //         }
	// 	});
	// }


	// 메인 bgm
	$(".hw-sound").click(function() {
		var audio = $('.ChristmasAudio');
		if ($(this).hasClass("play")) {
			$(this).removeClass("play").addClass("pause");
			audio.get(0).pause();
		} else if ($(this).hasClass("pause")) {
			$(this).removeClass("pause").addClass("play");
			audio.get(0).play();

			jQuery.ajax({
				type : "post",
				url : "/kor/main/setComStatLog.ajax",
				dataType : "json",
				data : {
					"drvSeq" : $("body").data("drvSeq"),
					"menu01" : "MAIN_BGM",
					"menu02" : "CLICK"
				},
				success : function(json)
				{
				},
				beforeSend : function()
				{
					//commonCtrl.startAjax();
				},
				complete : function()
				{
					//commonCtrl.completeAjax();
				}
			});
		}
	});

})

function resizeImgWidth(className, isHide){
	$(window).load(function(){
		$.each($("." + className), function(){
			if(isHide){
				$(this).show();

				$.each($(this).find('img'), function(){
					$(this).data('width', $(this).width());
				});

				$(this).hide();
			}else{
				$.each($(this).find('img'), function(){
					$(this).data('width', $(this).width());
				});
			}
		});

		$(window).resize();
	});

	$(window).resize(function(){
		$.each($('.' + className).find('img'), function(){
			if(Math.floor($('.' + className).width()) <= Math.floor($(this).data().width)){
				$(this).css('width', '100%');
			}else{
				$(this).css('width', '');
			}
		});
	});
};


function heightSizePc(){
	// tab 버튼 높이 잡기
	var maxH = 0;
	var longH;

	$('.tabBtn a span').each(function(q){
		longH = $('.tabBtn a span').eq(q).height() + 1;
		if(maxH < longH) maxH = longH;
		$('.tabBtn a').css('height', maxH+38);
	});
}

function heightSizeMobile(){
	// tab 버튼 높이 잡기
	var maxH = 0;
	var longH;

	$('.tabBtn a span').each(function(q){
		longH = $('.tabBtn a span').eq(q).height() + 1;
		if(maxH < longH) maxH = longH;
		$('.tabBtn a').css('height', maxH+18);
	});
}