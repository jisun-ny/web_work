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
</style>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<div class="box"></div>

	<script>
	/*
		.hide()
		.hide(number)
		.hide(number,function)
		.hide(object)
	*/
		$("#hideBtn").on("click", function(){
			//$(".box").hide(1000); //숨기는데 숫자를 넣으면 -> 1000ms에 걸쳐서 숨겨진다! 
			/*$(".box").hide(1000, function() {
				alert("뿅!");
			}); //두번째 인자로 함수를 넣으면? -> 1000ms에 걸쳐 숨기고 숨겨진 이후에는 함수를 실행해주세요!
			*/
			$(".box").hide({
				duration:1000;
				complete:function(){
					alert("뿅!");
				}
			}); //동작을 오브젝트로 전달할 수도 있다!
		});
		
		$("#showBtn").on("click", function(){
			$(".box").show();
		});
		
		$("#toggleBtn").on("click", function(){
			$(".box").toggle();
		})
	</script>
</body>
</html>