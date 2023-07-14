<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/Step03_effect.jsp</title>
<style>
.box {
	width: 100px;
	height: 100px;
	background-color: yellow;
	border: 1px solid red;
}

/* css3를 적용시킨 경우 */
.box2 {
	width: 100px;
	height: 100px;
	background-color: yellow;
	border: 1px solid red;
	/* transition 효과를 줄 수 있는 모든(all) css속성에 대해서 1초(1s) 동안 일정한 비율(linear)로 적용을 시켜라*/
	transition: all 1s linear;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<button id="moveBtn">움직이기</button>
	<button id="moveBtn2">움직이기2</button>
	<button id="moveBtn3">움직이기3</button>
	<div class="box"></div>
	<div class="box2"></div>
	<script>
	//트랜지션을 css에 선언해 놓은 경우
		$("#moveBtn3").on("click", function(){
			$(".box2").css("margin-left", "100px"); //이렇게 작성하면 1초동안 linear하게 적용이 자동으로 됨.
			//in vanilla js
			//document.querySelector(".box2").style.marginLeft = "100px";
		})
	
	
		/*
			움직이기 버튼을 눌렀을 때 .box div를 오른쪽으로 100px 움직이도록 해보세요
			단, 1초 동안 진행되도록!
		 */

		let mLeft = 0;
		$("#moveBtn").on("click", function() {
			setInterval(function() {
				mLeft += 1; // 1 = 100/100; 1/100초마다가 1/100픽셀 움직여야하니까!

				$(".box").css("margin-left", mLeft + "px"); //초 마다 숫자가 커저야하니까 변수가 하나 필요하다! 선언하고 가져다 붙이기!
				if (mLeft >= 101) {
					return
				};
			}, 10);
			//1000 -> 1초 마다 한 번씩
			//100 -> 1/10초마다 한 번씩
			//10 -> 1/100초마다 한 번씩
		});

		/*
		let mLeft = 0;
		$("#moveBtn").on("click", function(){
			let seq = setInterval(function(){
				mLeft += 1; // 1 = 100/100; 1/100초마다가 1/100픽셀 움직여야하니까!
				if(mLeft == 100){
					//인터발의 순서값(sequence) 값을 이용해서 취소할 수 있따 (setInterval <-> clearInterval)
					clearIntervla(seq);
				};
				$("e.target").css("margin-left", mLeft+"px"); //초 마다 숫자가 커저야하니까 변수가 하나 필요하다! 선언하고 가져다 붙이기!
				
			}, 10);
		
		});
		 */

		$("#moveBtn2").on("click", function() {
			$(".box").animate({
				"margin-left" : "+=100px" //마진 레프트값을 누를떄마다 100px씩 증가
			//변화시킬 css "속성명" : "속성값"
			}, 1000); //animate에는 {}오브젝트를 옵션으로 전달
		})

		//fade는 투명도를 조절!
		$("#hideBtn").on("click", function() {
			//$(".box").fadeOut();
			$(".box").fadeOut(1000, function() {
				alert("뿅!");
			});
		});

		$("#showBtn").on("click", function() {
			$(".box").fadeIn({
				duration : 2000,
				complete : function() {
					alert("짠!");
				}
			});
		});

		$("#toggleBtn").on("click", function() {
			$(".box").fadeToggle();
		})
	</script>
</body>
</html>