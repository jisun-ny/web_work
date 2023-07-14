<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/Step02_ajax.jsp</title>
</head>
<body>
	<h1>ajax 요청</h1>
	<button id="requestBtn">요청하기</button>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
	//실행의 흐름 - 페이지 로딩시점
		$("#requestBtn").on("click", function() {
			//$(), $. 달러는 함수이기도 하면서 오브젝트이기도 하다.
			//ajax함수에 오브젝트 전달
			//실행의 흐름 - 버튼이 눌렸을 때
			$.ajax({
				url:"${pageContext.request.contextPath }/cafe/json_list2.jsp", //요청 url
				method:"get", //요청 방식
				data:{/*PageNum:1*/}, //요청 파라미터 (요청 파라미터를 전달하고싶으면 오브젝트에 담아서 전달하자! ex.PageNum라는 파라미터 명으로 1전달 )
				//실행의 흐름 - 요청에 응답이 왔을 때
				success:function(data){ //data: ajax 요청에 대한 응답 //제이슨 문자열을 jquery내부적으로 object나 array로 바꿔줌.
					console.log(data);//응답이 왔을 때 실행할 함수 등록
				}
			})
		})
	</script>
</body>
</html>