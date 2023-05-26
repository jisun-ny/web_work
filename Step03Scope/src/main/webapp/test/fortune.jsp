<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	 //servlet과 jsp가 합동하면 jsp페이지의 java코드(logic)이 사라짐.
	 // servlet은 응답에 필요한 데이터만 모으는데 집중
	 // jsp는 응답만 집중하는 분업을 할 수 있따. 프로젝트의 규모가 클때만.
	 String fortune = (String)request.getAttribute("fortuneToday");
	//request 영역에 담긴 fortune 키값의 밸류를 가져온다. request영역 --> request scope
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/fortune.jsp</title>
</head>
<body>
	<div class="container">
		<p>오늘의 운세 : <strong><%=fortune %></strong></p>
	</div>
</body>
</html>