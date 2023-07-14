/**
 * jquery gura 플러그 인
 */

//제이쿼리가 먼저 로딩되어있어야 함.
(function($){
		$.fn.gura= function(options){
			let settings = $.extend({
				msg:"나는 플러그인이다.",
				color:"#ff00ff"
			}, options);		
			this.text(settings.msg).css("color", settings.color);			
			return this;
		};
	})(jQuery);
//이후 gura라는 함수가 생김.