<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test01.jsp</title>
</head>
<body>
	<h1>fetch 함수 테스트</h1>
	<button id="myBtn">눌러보셈</button>
	<a href=" ${pageContext.request.contextPath }/index.jsp ">눌러보셈</a>
	<script>
		document.querySelector("#myBtn").addEventListener("click", () => {
			const msg = prompt("메세지 입력..."); //수행순서 1 --> 얘를 입력하고 확인을 누르기전까지 밑으로 실행 흐름이 안내려감.
			console.log("입력완료!"); //2
			console.log("-----"); //3
			
			//fetch 함수가 무얼 하는 함수인지 잠시 테스트 해보세요
			//위의 링크를 눌렀을 떄와 차이점은?
			// 링크를 누르면 요청이 됨. index.jsp로 요청을 보내면 문자열이 (해석된 채로)응답됨. --> 페이지 이동(요청)
			//but! fetch함수는 요청을 해도 페이지가 이동되지 않음!
			//페이지 전환 없이 서버에다가 요청을 하는방식이 존재한다~~ 응답하는 문자열을 받아 올 수도 있ㄷ ㅏ~ fetch 함수~
			//ex) 회원 가입 폼 작성 중 아이디 중복확인. 더보기 버튼 
			
			//근데 fetch는 그냥 콜백함수 등록하고 넘어감. 실행이 되던 말건 바로 콘솔로 넘어갔다가 나중에 응답이 오면 then 실행! --> 비동기 실행
			fetch( "${pageContext.request.contextPath }/index.jsp")//1 //Promise type --> 그렇기 때문에 뒤에 .then() 가능
			.then(function(response){//3
				return response.text(); //Promise type --> 그렇기 때문에 뒤에 .then() 가능
			})
			.then(function(data) {//4
				console.log(data);
			});
			
			console.log("요청했습니다!");//2
		});
	</script>
</body>
</html>