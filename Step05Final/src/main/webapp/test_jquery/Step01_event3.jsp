<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test_jquery/Step01_event3.jsp</title>
</head>
<body>
	<h1>이벤트 처리</h1>
	<input type="text" id="inputMsg" placeholder="메세지 입력..." />
	<button id="sendBtn">전송</button>
	<p id="current"></p>
	<ul class="msgList">
	
	</ul>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
	//이미 존재하는 문서객체를 참조
		$("#inputMsg").on("keyup", function(e){
			//현재까지 입력한 문자열을 읽어와서
			//e.target도 달러 함수로 감싸주면 제이쿼리동작을 하게할 수 있다.
			
			//만일 Enter키를 눌러도 전송버튼을 눌렀을 때와 똑같이 실행 될 수 있도록해주자.
			console.log(e.keyCode);
			if(e.keyCode == 13){
				const msg = $("#inputMsg").val();
				$("<li>").text(msg).appendTo("#msgList");
				$("#inputMsg").val("").focus();
			}
			const msg = $(e.target).val();
			//p요소에 출력
			$("#current").text(msg);
		})
	
		//전송 버튼을 눌렀을 때 실행할 함수 등록
		$("#sendBtn").on("click", function(){
			//1.입력한 문자열을 읽어와서
			const msg = $("#inputMsg").val();
			//2. li요소를 만들어서 innerText에 출력하고 id가 msgList인 요소에 추가하기
			//$("<li>")는 바닐라 자바스크립트에서 $(document.createElement("li"))와 같은 것
			//없던 것을 만들어서 선택
			$("<li>").text(msg).appendTo("#msgList");
			
			/*
				in vanila js
				const li = document.createElement("li");
				li.innerText = "msg"
				document.querySelector("#msgList").append(li);
			*/
			//val에 빈 문자열을 넣어주면 클릭을 한 후 입려한 내용이 input요소에서 삭제되는 효과를 나타낸다.
			$("#inputMsg").val("").focus()
		})
	</script>
</body>
</html>