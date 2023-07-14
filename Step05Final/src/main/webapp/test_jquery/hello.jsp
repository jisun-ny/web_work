<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/hello.jsp</title>
</head>
<body>
	<div class="container">
		<input type="text" id="inputMsg" placeholder="문자열 입력..." />
		<button id="sendBtn">전송</button>
		<p id="result"></p>		
	</div>
	<div>div1</div>
	<div class="my-class">div2</div>
	<div class="my-class">div3</div>
	<div id="one">div4</div>
	<!-- jquery 로딩 시킨다. -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		//위의 input요소에 문자열을 입력하고 전송버튼을 누라면 입력한 문자열을 p의 요소의 innerText에 출력되도록 프로그래밍 해 보세요.
/*
		document.querySelector("#sendBtn").addEventListner("click", () => {
			const msg = document.querySelector("#inputMsg").value;
			document.querySelector("#result").innerText = msg;
		});
*/
		
		//jquery를 이용해서 똑같은 작업을 해보자! (jquery도 누군가 짜 놓은 자바스크립트다...)
		
		//달라 함수 호출! function $ ()
		$("#sendBtn").on("click", () => {
			const msg = $("#inputMsg").val();
			$("#result").text(msg);
		});
		
		//document.querySelector("#sendBtn") --> object type이 리턴 됨!
		//document.querySelectorAll() --> array type이 리턴 됨!
		//$("#sendBtn") -> array가 리턴 됨(제이쿼리의 기능이 포함된 array-> on(), val(), text() 함수들)
		
		/*
			$().action()
			---
			선택자를 문자열로 작성. css의 선택자와 동일하다 #, .요소명/속성/자손/자식 선택자 등등.. 			
			여기에는 배열의 참조값이 리턴되는데 그 배열은 jquery의 기능이 추가된 배열이다.
			이 리턴되는 배열에는 선택자에 부합하는 모든 문서객체의 참조값이 순서대로 들어있다
			예를들어 아이디 선택자를 사용하면 배열이긴 하지만 아이템은 한개
			요소명 선택자나 클래스 선택자를 사용한다면 배열 안에는 여러 아이템이 들어갈 수도 있따. 예를 들어 p요소 선택자를 사용한다면 모든 p요소에 대한 정보가 배열에 들어있다.
			
			.action()은 앞에서 선택된 배열 속 모든 아이템에 대해서 동작함!! -> 반복문을 돌 필요가 없다!
				.on(), .val(), .text()
		*/
		
		/*
			$(".my-class").text("안녕"); 이렇게 한다면 
			.my-class를 클래스를 가진 것들이 배열에 들어간다. 그리고 텍스트가 안녕으로 바뀐다.
			이떄 .text("안녕")가 실행되고 나서도 jquery기능을 가진 배열이 리턴된다! 따라서
			$(".my-class").text("안녕").css("color","red"); 이렇게 체인형태로 계속 추가 가능.
			$().action1().action2().action3(). ...
			$("div").text("hi").css("color","red").css("background-color","yellow");
		*/
		/*
			$("div").first().text("bye"); 
			첫번째 div에 대한 동작
			
			$("#inputMsg").val(); 이렇게 하면 그냥 읽어온 값을 리턴해줌!
			이런 경우는 배열을 리턴해주는 것이 아님! 따라서 .동작.동작 이런식으로는 사용 못함!
			
			$("#inputMsg").val("morning!"); 
			val()함수의 매개변수로 전달하면 value값을 넣어준다! --> 이 경우는 배열이 리턴됨! .동작 사용 가능!
			
			let a = $("#one").text();
			--> a눈 String type
			let b = $("#one").text("hi");
			--> b는 array type
		*/
		
		/*
			$().action1().action2().actin3()
			selector
			
			.action() vs .action(xx)
			같은 동작이라도 매개변수를 전달하는것과 안하는 것은 반대 동작을 할 가능성이 높다.
		*/
		/*
			$("#inputMsg").attr("placeholder") --> 이렇게 attr()에 값 하나 전달하면 속성 불러오기(읽어오기)
			$("#inputMsg").attr("placeholder", "오잉") --> 두개 전달하면 속성값을 바꾸기(수정 및 추가)
			
			$("one").attr("style", "color:red")
			$("one").css("color", "red")로도 할 수 있음. 인라인css를 좀 더 편하게 해 줌
		*/
		
	</script>
</body>
</html>