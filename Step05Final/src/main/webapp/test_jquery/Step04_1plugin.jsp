<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/plugin.jsp</title>
</head>
<body>
	<p>p1</p>
	<p id="one">p2</p>
	<p id="two">p3</p>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<!-- jQuery plugin js 로딩 -->
<script src="js/jquery.gura.js"></script>

<script>
	//jquery의 기능을 확장하기(plugin)
/*
	(function($){
		//함수 안에서 만든 변수는 local 변수
		$.fn.gura= function(options){
			//default값 정의
			//let settings = $.extend({}, options);
								//기본값	//오버라이드할 값
			let settings = $.extend({
				msg:"나는 플러그인이다."
				color:"#ff00ff"
			}, options);
			//this는 $() 함수를 이용해서 선택된 객체
			this.text(settings.msg).css("color", settings.color);
			//chain형태로 동작이 가능하도록 this를 다시 리턴해준다.
			return this;
		};
	})(jQuery); //$ == jQuery 즉, 함수를 호춣면서 제이쿼리를 전달함.
	//(function(){})()
	//괄호 안에 function type data가 있음. 함수는 만들자 마자 콜할 수 있다.
	//함수를 만들자마자 바로 콜 해버리는것! 어차피 한번밖에 안 쓸 함수라면 굳이 형식을 따져가면서 만들 필요 없다.
	
	//프로그래밍 해놓고 그 내용을 이런 함수 안에다가 넣어버리면 global 변수를 없앨 수 있다.
	
	//$().gura({}); 이렇게 구라에 {}를 전달하면 오버라이드할 수 있다.
*/	
	$("#one").gura();
	$("#two").gura({
		msg:"오잉?", //오버라이드할 값
		color:"#ffff00"
	});
</script>
</body>
</html>