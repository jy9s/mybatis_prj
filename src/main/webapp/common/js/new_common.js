$(document).ready(function(){
	$(document).on('click', '#loginKakao', function(){
		var urlattr = $(this).attr('urlattr');
		var popup = window.open(urlattr, '카카오로그인', 'width=640px,height=480px,scrollbars=no');
	});
    $('map').imageMapResize();
});

var top_banner_slide = new Swiper(".top_banner", {
	slidesPerView: 1,
    speed: 1000,
	effect: "creative",
      creativeEffect: {
        prev: {
            shadow: true,
            translate: ["-20%", 0, -1],
          },
          next: {
            translate: ["100%", 0, 0],
          },
      },
	autoplay: {
		delay: 5000,
		disableOnInteraction: false,
		stopOnLastSlide: false,
	},
});

var main_video_slide = new Swiper(".main_video_slide", {
	slidesPerView: "auto",
	spaceBetween: 16,
	freeMode: true,
	breakpoints: {
		769:{
			spaceBetween: 24,
		}
	}
});

var main_sale_slide = new Swiper(".main_sale_slide", {
	slidesPerView: 1,
	pagination: {
		el: ".swiper-pagination",
		clickable: true,
	},
});

document.addEventListener('DOMContentLoaded', function () {
	var tabSliders = document.querySelectorAll('.tab_att');

	tabSliders.forEach(function (slider, index) {
		var sliderId = index + 1;
		var main_att_slide = new Swiper(slider, {
		observer: true,
		observeParents: true,
		slidesPerView: "auto",
		spaceBetween: 12,
		freeMode: true,
		breakpoints: {
			769:{
				spaceBetween: 24,
			},
			1152:{
				spaceBetween: 0,
			},
		}
		});
	});

	document.querySelectorAll('.main_att .tab button').forEach(function (tab) {
		tab.addEventListener('click', function () {
			document.querySelector('.main_att .tab button.on').classList.remove('on');
			this.classList.add('on');
			var targetSliderId = this.getAttribute('data-tab');
			tabSliders.forEach(function (slider) {
				slider.style.display = slider.getAttribute('data-slider') === targetSliderId ? 'block' : 'none';
				slider.swiper.update();
			});
		});
	});
});

$('.main_att .tab button').click(function(){
	if($(this).hasClass('child')){
		$('.main_att_wrap').removeClass('bg3').addClass('bg2');
	}else if($(this).hasClass('rain')){
		$('.main_att_wrap').removeClass('bg2').addClass('bg3');
	}else{
		$('.main_att_wrap').removeClass('bg2 bg3');
	}
});

var yearswiper = new Swiper(".year_records", {
    slidesPerView: "auto",
    freeMode: true
});
