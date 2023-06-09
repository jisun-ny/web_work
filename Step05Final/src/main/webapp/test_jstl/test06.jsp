<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	//sample 데이터
	request.setAttribute("hobby", "game/programming/piano"); // 슬래쉬로 구분된 문자열
	request.setAttribute("friends", "김구라, 해골, 원숭이"); //컴마로 구분된 문자열
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jstl/test06.jsp</title>
</head>
<body>
	<h1>forTokens 활용</h1>
	<h2>취미목록</h2>
	<ul>
		<c:forTokens var="tmp" items="${hobby }" delims="/">
		<%--  										구분자 알려주기 --%>
			<li>${tmp }</li>
		</c:forTokens>
	</ul>
	
	<h2>친구 목록</h2>
	<ul>
		<c:forTokens var="tmp" items="${friends }" delims=",">
			<li>${tmp }</li>
		</c:forTokens>
	</ul>
</body>
</html>